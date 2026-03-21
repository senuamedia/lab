; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"grad_regime"(i64 %x, i64 %t1, i64 %t2, i64 %t3) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.t1 = alloca i64
  store i64 %t1, ptr %local.t1
  %local.t2 = alloca i64
  store i64 %t2, ptr %local.t2
  %local.t3 = alloca i64
  store i64 %t3, ptr %local.t3
  %t22 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.2)
  %t23 = load i64, ptr %local.x
  %t24 = load i64, ptr %local.t1
  %t25 = call i64 @"sx_f64_sub"(i64 %t23, i64 %t24)
  %t26 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t25)
  %t27 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.3)
  %t28 = load i64, ptr %local.x
  %t29 = load i64, ptr %local.t2
  %t30 = call i64 @"sx_f64_sub"(i64 %t28, i64 %t29)
  %t31 = call i64 @"sx_f64_mul"(i64 %t27, i64 %t30)
  %t32 = call i64 @"sx_f64_add"(i64 %t26, i64 %t31)
  %t33 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.4)
  %t34 = load i64, ptr %local.x
  %t35 = load i64, ptr %local.t3
  %t36 = call i64 @"sx_f64_sub"(i64 %t34, i64 %t35)
  %t37 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t36)
  %t38 = call i64 @"sx_f64_add"(i64 %t32, i64 %t37)
  ret i64 %t38
}

define i64 @"combined_loss"(i64 %x0, i64 %x1, i64 %x2, i64 %x3, i64 %regime) nounwind {
entry:
  %local.l.39 = alloca i64
  %local.x0 = alloca i64
  store i64 %x0, ptr %local.x0
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.x2 = alloca i64
  store i64 %x2, ptr %local.x2
  %local.x3 = alloca i64
  store i64 %x3, ptr %local.x3
  %local.regime = alloca i64
  store i64 %regime, ptr %local.regime
  %t40 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.5)
  store i64 %t40, ptr %local.l.39
  %t41 = load i64, ptr %local.regime
  %t42 = icmp eq i64 %t41, 0
  %t43 = zext i1 %t42 to i64
  %t44 = icmp ne i64 %t43, 0
  br i1 %t44, label %then3, label %else3
then3:
  %t45 = load i64, ptr %local.x0
  %t46 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.6)
  %t47 = call i64 @"sx_f64_sub"(i64 %t45, i64 %t46)
  %t48 = load i64, ptr %local.x0
  %t49 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.7)
  %t50 = call i64 @"sx_f64_sub"(i64 %t48, i64 %t49)
  %t51 = call i64 @"sx_f64_mul"(i64 %t47, i64 %t50)
  %t52 = load i64, ptr %local.x1
  %t53 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.8)
  %t54 = call i64 @"sx_f64_sub"(i64 %t52, i64 %t53)
  %t55 = load i64, ptr %local.x1
  %t56 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.9)
  %t57 = call i64 @"sx_f64_sub"(i64 %t55, i64 %t56)
  %t58 = call i64 @"sx_f64_mul"(i64 %t54, i64 %t57)
  %t59 = call i64 @"sx_f64_add"(i64 %t51, i64 %t58)
  %t60 = load i64, ptr %local.x2
  %t61 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.10)
  %t62 = call i64 @"sx_f64_add"(i64 %t60, i64 %t61)
  %t63 = load i64, ptr %local.x2
  %t64 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.11)
  %t65 = call i64 @"sx_f64_add"(i64 %t63, i64 %t64)
  %t66 = call i64 @"sx_f64_mul"(i64 %t62, i64 %t65)
  %t67 = call i64 @"sx_f64_add"(i64 %t59, i64 %t66)
  %t68 = load i64, ptr %local.x3
  %t69 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.12)
  %t70 = call i64 @"sx_f64_sub"(i64 %t68, i64 %t69)
  %t71 = load i64, ptr %local.x3
  %t72 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.13)
  %t73 = call i64 @"sx_f64_sub"(i64 %t71, i64 %t72)
  %t74 = call i64 @"sx_f64_mul"(i64 %t70, i64 %t73)
  %t75 = call i64 @"sx_f64_add"(i64 %t67, i64 %t74)
  store i64 %t75, ptr %local.l.39
  %t76 = load i64, ptr %local.l.39
  %t77 = load i64, ptr %local.x0
  %t78 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.14)
  %t79 = call i64 @"sx_f64_add"(i64 %t77, i64 %t78)
  %t80 = load i64, ptr %local.x0
  %t81 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.15)
  %t82 = call i64 @"sx_f64_add"(i64 %t80, i64 %t81)
  %t83 = call i64 @"sx_f64_mul"(i64 %t79, i64 %t82)
  %t84 = call i64 @"sx_f64_add"(i64 %t76, i64 %t83)
  %t85 = load i64, ptr %local.x1
  %t86 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.16)
  %t87 = call i64 @"sx_f64_sub"(i64 %t85, i64 %t86)
  %t88 = load i64, ptr %local.x1
  %t89 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.17)
  %t90 = call i64 @"sx_f64_sub"(i64 %t88, i64 %t89)
  %t91 = call i64 @"sx_f64_mul"(i64 %t87, i64 %t90)
  %t92 = call i64 @"sx_f64_add"(i64 %t84, i64 %t91)
  %t93 = load i64, ptr %local.x2
  %t94 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.18)
  %t95 = call i64 @"sx_f64_sub"(i64 %t93, i64 %t94)
  %t96 = load i64, ptr %local.x2
  %t97 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.19)
  %t98 = call i64 @"sx_f64_sub"(i64 %t96, i64 %t97)
  %t99 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t98)
  %t100 = call i64 @"sx_f64_add"(i64 %t92, i64 %t99)
  %t101 = load i64, ptr %local.x3
  %t102 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.20)
  %t103 = call i64 @"sx_f64_add"(i64 %t101, i64 %t102)
  %t104 = load i64, ptr %local.x3
  %t105 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.21)
  %t106 = call i64 @"sx_f64_add"(i64 %t104, i64 %t105)
  %t107 = call i64 @"sx_f64_mul"(i64 %t103, i64 %t106)
  %t108 = call i64 @"sx_f64_add"(i64 %t100, i64 %t107)
  store i64 %t108, ptr %local.l.39
  %t109 = load i64, ptr %local.l.39
  %t110 = load i64, ptr %local.x0
  %t111 = load i64, ptr %local.x0
  %t112 = call i64 @"sx_f64_mul"(i64 %t110, i64 %t111)
  %t113 = call i64 @"sx_f64_add"(i64 %t109, i64 %t112)
  %t114 = load i64, ptr %local.x1
  %t115 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.22)
  %t116 = call i64 @"sx_f64_add"(i64 %t114, i64 %t115)
  %t117 = load i64, ptr %local.x1
  %t118 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.23)
  %t119 = call i64 @"sx_f64_add"(i64 %t117, i64 %t118)
  %t120 = call i64 @"sx_f64_mul"(i64 %t116, i64 %t119)
  %t121 = call i64 @"sx_f64_add"(i64 %t113, i64 %t120)
  %t122 = load i64, ptr %local.x2
  %t123 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.24)
  %t124 = call i64 @"sx_f64_sub"(i64 %t122, i64 %t123)
  %t125 = load i64, ptr %local.x2
  %t126 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.25)
  %t127 = call i64 @"sx_f64_sub"(i64 %t125, i64 %t126)
  %t128 = call i64 @"sx_f64_mul"(i64 %t124, i64 %t127)
  %t129 = call i64 @"sx_f64_add"(i64 %t121, i64 %t128)
  %t130 = load i64, ptr %local.x3
  %t131 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.26)
  %t132 = call i64 @"sx_f64_sub"(i64 %t130, i64 %t131)
  %t133 = load i64, ptr %local.x3
  %t134 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.27)
  %t135 = call i64 @"sx_f64_sub"(i64 %t133, i64 %t134)
  %t136 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t135)
  %t137 = call i64 @"sx_f64_add"(i64 %t129, i64 %t136)
  store i64 %t137, ptr %local.l.39
  br label %then3_end
then3_end:
  br label %endif3
else3:
  %t138 = load i64, ptr %local.x0
  %t139 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.28)
  %t140 = call i64 @"sx_f64_add"(i64 %t138, i64 %t139)
  %t141 = load i64, ptr %local.x0
  %t142 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.29)
  %t143 = call i64 @"sx_f64_add"(i64 %t141, i64 %t142)
  %t144 = call i64 @"sx_f64_mul"(i64 %t140, i64 %t143)
  %t145 = load i64, ptr %local.x1
  %t146 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.30)
  %t147 = call i64 @"sx_f64_add"(i64 %t145, i64 %t146)
  %t148 = load i64, ptr %local.x1
  %t149 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.31)
  %t150 = call i64 @"sx_f64_add"(i64 %t148, i64 %t149)
  %t151 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t150)
  %t152 = call i64 @"sx_f64_add"(i64 %t144, i64 %t151)
  %t153 = load i64, ptr %local.x2
  %t154 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.32)
  %t155 = call i64 @"sx_f64_sub"(i64 %t153, i64 %t154)
  %t156 = load i64, ptr %local.x2
  %t157 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.33)
  %t158 = call i64 @"sx_f64_sub"(i64 %t156, i64 %t157)
  %t159 = call i64 @"sx_f64_mul"(i64 %t155, i64 %t158)
  %t160 = call i64 @"sx_f64_add"(i64 %t152, i64 %t159)
  %t161 = load i64, ptr %local.x3
  %t162 = load i64, ptr %local.x3
  %t163 = call i64 @"sx_f64_mul"(i64 %t161, i64 %t162)
  %t164 = call i64 @"sx_f64_add"(i64 %t160, i64 %t163)
  store i64 %t164, ptr %local.l.39
  %t165 = load i64, ptr %local.l.39
  %t166 = load i64, ptr %local.x0
  %t167 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.34)
  %t168 = call i64 @"sx_f64_sub"(i64 %t166, i64 %t167)
  %t169 = load i64, ptr %local.x0
  %t170 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.35)
  %t171 = call i64 @"sx_f64_sub"(i64 %t169, i64 %t170)
  %t172 = call i64 @"sx_f64_mul"(i64 %t168, i64 %t171)
  %t173 = call i64 @"sx_f64_add"(i64 %t165, i64 %t172)
  %t174 = load i64, ptr %local.x1
  %t175 = load i64, ptr %local.x1
  %t176 = call i64 @"sx_f64_mul"(i64 %t174, i64 %t175)
  %t177 = call i64 @"sx_f64_add"(i64 %t173, i64 %t176)
  %t178 = load i64, ptr %local.x2
  %t179 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.36)
  %t180 = call i64 @"sx_f64_add"(i64 %t178, i64 %t179)
  %t181 = load i64, ptr %local.x2
  %t182 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.37)
  %t183 = call i64 @"sx_f64_add"(i64 %t181, i64 %t182)
  %t184 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t183)
  %t185 = call i64 @"sx_f64_add"(i64 %t177, i64 %t184)
  %t186 = load i64, ptr %local.x3
  %t187 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.38)
  %t188 = call i64 @"sx_f64_sub"(i64 %t186, i64 %t187)
  %t189 = load i64, ptr %local.x3
  %t190 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.39)
  %t191 = call i64 @"sx_f64_sub"(i64 %t189, i64 %t190)
  %t192 = call i64 @"sx_f64_mul"(i64 %t188, i64 %t191)
  %t193 = call i64 @"sx_f64_add"(i64 %t185, i64 %t192)
  store i64 %t193, ptr %local.l.39
  %t194 = load i64, ptr %local.l.39
  %t195 = load i64, ptr %local.x0
  %t196 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.40)
  %t197 = call i64 @"sx_f64_sub"(i64 %t195, i64 %t196)
  %t198 = load i64, ptr %local.x0
  %t199 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.41)
  %t200 = call i64 @"sx_f64_sub"(i64 %t198, i64 %t199)
  %t201 = call i64 @"sx_f64_mul"(i64 %t197, i64 %t200)
  %t202 = call i64 @"sx_f64_add"(i64 %t194, i64 %t201)
  %t203 = load i64, ptr %local.x1
  %t204 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.42)
  %t205 = call i64 @"sx_f64_sub"(i64 %t203, i64 %t204)
  %t206 = load i64, ptr %local.x1
  %t207 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.43)
  %t208 = call i64 @"sx_f64_sub"(i64 %t206, i64 %t207)
  %t209 = call i64 @"sx_f64_mul"(i64 %t205, i64 %t208)
  %t210 = call i64 @"sx_f64_add"(i64 %t202, i64 %t209)
  %t211 = load i64, ptr %local.x2
  %t212 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.44)
  %t213 = call i64 @"sx_f64_add"(i64 %t211, i64 %t212)
  %t214 = load i64, ptr %local.x2
  %t215 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.45)
  %t216 = call i64 @"sx_f64_add"(i64 %t214, i64 %t215)
  %t217 = call i64 @"sx_f64_mul"(i64 %t213, i64 %t216)
  %t218 = call i64 @"sx_f64_add"(i64 %t210, i64 %t217)
  %t219 = load i64, ptr %local.x3
  %t220 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.46)
  %t221 = call i64 @"sx_f64_add"(i64 %t219, i64 %t220)
  %t222 = load i64, ptr %local.x3
  %t223 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.47)
  %t224 = call i64 @"sx_f64_add"(i64 %t222, i64 %t223)
  %t225 = call i64 @"sx_f64_mul"(i64 %t221, i64 %t224)
  %t226 = call i64 @"sx_f64_add"(i64 %t218, i64 %t225)
  store i64 %t226, ptr %local.l.39
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t227 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t228 = load i64, ptr %local.l.39
  ret i64 %t228
}

define i64 @"train_shifting"(i64 %w1, i64 %w2, i64 %w3, i64 %base_lr, i64 %shift_step, i64 %total_steps) nounwind {
entry:
  %local.x0.229 = alloca i64
  %local.x1.230 = alloca i64
  %local.x2.231 = alloca i64
  %local.x3.232 = alloca i64
  %local.step.233 = alloca i64
  %local.lr.234 = alloca i64
  %local.prev_loss.235 = alloca i64
  %local.prev_drift.236 = alloca i64
  %local.prev_s.237 = alloca i64
  %local.prev_s_prime.238 = alloca i64
  %local.drift.239 = alloca i64
  %local.s_val.240 = alloca i64
  %local.s_prime.241 = alloca i64
  %local.s_double.242 = alloca i64
  %local.loss.243 = alloca i64
  %local.regime.244 = alloca i64
  %local.g0.245 = alloca i64
  %local.g1.246 = alloca i64
  %local.g2.247 = alloca i64
  %local.g3.248 = alloca i64
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.base_lr = alloca i64
  store i64 %base_lr, ptr %local.base_lr
  %local.shift_step = alloca i64
  store i64 %shift_step, ptr %local.shift_step
  %local.total_steps = alloca i64
  store i64 %total_steps, ptr %local.total_steps
  %t249 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.48)
  store i64 %t249, ptr %local.x0.229
  %t250 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.49)
  store i64 %t250, ptr %local.x1.230
  %t251 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.50)
  store i64 %t251, ptr %local.x2.231
  %t252 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.51)
  store i64 %t252, ptr %local.x3.232
  store i64 0, ptr %local.step.233
  %t253 = load i64, ptr %local.base_lr
  store i64 %t253, ptr %local.lr.234
  %t254 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.52)
  store i64 %t254, ptr %local.prev_loss.235
  %t255 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.53)
  store i64 %t255, ptr %local.prev_drift.236
  %t256 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.54)
  store i64 %t256, ptr %local.prev_s.237
  %t257 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.55)
  store i64 %t257, ptr %local.prev_s_prime.238
  %t258 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.56)
  store i64 %t258, ptr %local.drift.239
  %t259 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.57)
  store i64 %t259, ptr %local.s_val.240
  %t260 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.58)
  store i64 %t260, ptr %local.s_prime.241
  %t261 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.59)
  store i64 %t261, ptr %local.s_double.242
  %t262 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.60)
  store i64 %t262, ptr %local.loss.243
  store i64 0, ptr %local.regime.244
  %t263 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.61)
  store i64 %t263, ptr %local.g0.245
  %t264 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.62)
  store i64 %t264, ptr %local.g1.246
  %t265 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.63)
  store i64 %t265, ptr %local.g2.247
  %t266 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.64)
  store i64 %t266, ptr %local.g3.248
  br label %loop4
loop4:
  %t267 = load i64, ptr %local.step.233
  %t268 = load i64, ptr %local.total_steps
  %t269 = icmp slt i64 %t267, %t268
  %t270 = zext i1 %t269 to i64
  %t271 = icmp ne i64 %t270, 0
  br i1 %t271, label %body4, label %endloop4
body4:
  %t272 = load i64, ptr %local.step.233
  %t273 = load i64, ptr %local.shift_step
  %t274 = icmp sge i64 %t272, %t273
  %t275 = zext i1 %t274 to i64
  %t276 = icmp ne i64 %t275, 0
  br i1 %t276, label %then5, label %else5
then5:
  store i64 1, ptr %local.regime.244
  br label %then5_end
then5_end:
  br label %endif5
else5:
  store i64 0, ptr %local.regime.244
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t277 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t278 = load i64, ptr %local.regime.244
  %t279 = icmp eq i64 %t278, 0
  %t280 = zext i1 %t279 to i64
  %t281 = icmp ne i64 %t280, 0
  br i1 %t281, label %then6, label %else6
then6:
  %t282 = load i64, ptr %local.x0.229
  %t283 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.65)
  %t284 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.66)
  %t285 = xor i64 %t284, -9223372036854775808
  %t286 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.67)
  %t287 = call i64 @"grad_regime"(i64 %t282, i64 %t283, i64 %t285, i64 %t286)
  store i64 %t287, ptr %local.g0.245
  %t288 = load i64, ptr %local.x1.230
  %t289 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.68)
  %t290 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.69)
  %t291 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.70)
  %t292 = xor i64 %t291, -9223372036854775808
  %t293 = call i64 @"grad_regime"(i64 %t288, i64 %t289, i64 %t290, i64 %t292)
  store i64 %t293, ptr %local.g1.246
  %t294 = load i64, ptr %local.x2.231
  %t295 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.71)
  %t296 = xor i64 %t295, -9223372036854775808
  %t297 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.72)
  %t298 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.73)
  %t299 = call i64 @"grad_regime"(i64 %t294, i64 %t296, i64 %t297, i64 %t298)
  store i64 %t299, ptr %local.g2.247
  %t300 = load i64, ptr %local.x3.232
  %t301 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.74)
  %t302 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.75)
  %t303 = xor i64 %t302, -9223372036854775808
  %t304 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.76)
  %t305 = call i64 @"grad_regime"(i64 %t300, i64 %t301, i64 %t303, i64 %t304)
  store i64 %t305, ptr %local.g3.248
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t306 = load i64, ptr %local.x0.229
  %t307 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.77)
  %t308 = xor i64 %t307, -9223372036854775808
  %t309 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.78)
  %t310 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.79)
  %t311 = call i64 @"grad_regime"(i64 %t306, i64 %t308, i64 %t309, i64 %t310)
  store i64 %t311, ptr %local.g0.245
  %t312 = load i64, ptr %local.x1.230
  %t313 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.80)
  %t314 = xor i64 %t313, -9223372036854775808
  %t315 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.81)
  %t316 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.82)
  %t317 = call i64 @"grad_regime"(i64 %t312, i64 %t314, i64 %t315, i64 %t316)
  store i64 %t317, ptr %local.g1.246
  %t318 = load i64, ptr %local.x2.231
  %t319 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.83)
  %t320 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.84)
  %t321 = xor i64 %t320, -9223372036854775808
  %t322 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.85)
  %t323 = xor i64 %t322, -9223372036854775808
  %t324 = call i64 @"grad_regime"(i64 %t318, i64 %t319, i64 %t321, i64 %t323)
  store i64 %t324, ptr %local.g2.247
  %t325 = load i64, ptr %local.x3.232
  %t326 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.86)
  %t327 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.87)
  %t328 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.88)
  %t329 = xor i64 %t328, -9223372036854775808
  %t330 = call i64 @"grad_regime"(i64 %t325, i64 %t326, i64 %t327, i64 %t329)
  store i64 %t330, ptr %local.g3.248
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t331 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t332 = load i64, ptr %local.x0.229
  %t333 = load i64, ptr %local.lr.234
  %t334 = load i64, ptr %local.g0.245
  %t335 = call i64 @"sx_f64_mul"(i64 %t333, i64 %t334)
  %t336 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.89)
  %t337 = call i64 @"sx_f64_div"(i64 %t335, i64 %t336)
  %t338 = call i64 @"sx_f64_sub"(i64 %t332, i64 %t337)
  store i64 %t338, ptr %local.x0.229
  %t339 = load i64, ptr %local.x1.230
  %t340 = load i64, ptr %local.lr.234
  %t341 = load i64, ptr %local.g1.246
  %t342 = call i64 @"sx_f64_mul"(i64 %t340, i64 %t341)
  %t343 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.90)
  %t344 = call i64 @"sx_f64_div"(i64 %t342, i64 %t343)
  %t345 = call i64 @"sx_f64_sub"(i64 %t339, i64 %t344)
  store i64 %t345, ptr %local.x1.230
  %t346 = load i64, ptr %local.x2.231
  %t347 = load i64, ptr %local.lr.234
  %t348 = load i64, ptr %local.g2.247
  %t349 = call i64 @"sx_f64_mul"(i64 %t347, i64 %t348)
  %t350 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.91)
  %t351 = call i64 @"sx_f64_div"(i64 %t349, i64 %t350)
  %t352 = call i64 @"sx_f64_sub"(i64 %t346, i64 %t351)
  store i64 %t352, ptr %local.x2.231
  %t353 = load i64, ptr %local.x3.232
  %t354 = load i64, ptr %local.lr.234
  %t355 = load i64, ptr %local.g3.248
  %t356 = call i64 @"sx_f64_mul"(i64 %t354, i64 %t355)
  %t357 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.92)
  %t358 = call i64 @"sx_f64_div"(i64 %t356, i64 %t357)
  %t359 = call i64 @"sx_f64_sub"(i64 %t353, i64 %t358)
  store i64 %t359, ptr %local.x3.232
  %t360 = load i64, ptr %local.x0.229
  %t361 = load i64, ptr %local.x1.230
  %t362 = load i64, ptr %local.x2.231
  %t363 = load i64, ptr %local.x3.232
  %t364 = load i64, ptr %local.regime.244
  %t365 = call i64 @"combined_loss"(i64 %t360, i64 %t361, i64 %t362, i64 %t363, i64 %t364)
  store i64 %t365, ptr %local.loss.243
  %t366 = load i64, ptr %local.loss.243
  %t367 = load i64, ptr %local.prev_loss.235
  %t368 = call i64 @"sx_f64_sub"(i64 %t366, i64 %t367)
  %t369 = call i64 @"abs_f64"(i64 %t368)
  store i64 %t369, ptr %local.drift.239
  %t370 = load i64, ptr %local.prev_drift.236
  %t371 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.93)
  %t372 = call i64 @"sx_f64_gt"(i64 %t370, i64 %t371)
  %t373 = icmp ne i64 %t372, 0
  br i1 %t373, label %then7, label %else7
then7:
  %t374 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.94)
  %t375 = load i64, ptr %local.drift.239
  %t376 = load i64, ptr %local.prev_drift.236
  %t377 = call i64 @"sx_f64_div"(i64 %t375, i64 %t376)
  %t378 = call i64 @"sx_f64_sub"(i64 %t374, i64 %t377)
  store i64 %t378, ptr %local.s_val.240
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t379 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.95)
  store i64 %t379, ptr %local.s_val.240
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t380 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t381 = load i64, ptr %local.s_val.240
  %t382 = load i64, ptr %local.prev_s.237
  %t383 = call i64 @"sx_f64_sub"(i64 %t381, i64 %t382)
  store i64 %t383, ptr %local.s_prime.241
  %t384 = load i64, ptr %local.s_prime.241
  %t385 = load i64, ptr %local.prev_s_prime.238
  %t386 = call i64 @"sx_f64_sub"(i64 %t384, i64 %t385)
  store i64 %t386, ptr %local.s_double.242
  %t387 = load i64, ptr %local.base_lr
  %t388 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.96)
  %t389 = load i64, ptr %local.w1
  %t390 = load i64, ptr %local.s_val.240
  %t391 = call i64 @"sx_f64_mul"(i64 %t389, i64 %t390)
  %t392 = call i64 @"sx_f64_add"(i64 %t388, i64 %t391)
  %t393 = load i64, ptr %local.w2
  %t394 = load i64, ptr %local.s_prime.241
  %t395 = call i64 @"sx_f64_mul"(i64 %t393, i64 %t394)
  %t396 = call i64 @"sx_f64_add"(i64 %t392, i64 %t395)
  %t397 = load i64, ptr %local.w3
  %t398 = load i64, ptr %local.s_double.242
  %t399 = call i64 @"sx_f64_mul"(i64 %t397, i64 %t398)
  %t400 = call i64 @"sx_f64_add"(i64 %t396, i64 %t399)
  %t401 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.97)
  %t402 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.98)
  %t403 = call i64 @"clamp"(i64 %t400, i64 %t401, i64 %t402)
  %t404 = call i64 @"sx_f64_mul"(i64 %t387, i64 %t403)
  store i64 %t404, ptr %local.lr.234
  %t405 = load i64, ptr %local.step.233
  %t406 = load i64, ptr %local.shift_step
  %t407 = sub i64 %t406, 5
  %t408 = icmp eq i64 %t405, %t407
  %t409 = zext i1 %t408 to i64
  %t410 = icmp ne i64 %t409, 0
  br i1 %t410, label %then8, label %else8
then8:
  %t411 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.99)
  %t412 = ptrtoint ptr %t411 to i64
  %t413 = inttoptr i64 %t412 to ptr
  call void @intrinsic_print(ptr %t413)
  %t414 = load i64, ptr %local.step.233
  call void @print_i64(i64 %t414)
  %t415 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.100)
  %t416 = ptrtoint ptr %t415 to i64
  %t417 = inttoptr i64 %t416 to ptr
  call void @intrinsic_print(ptr %t417)
  %t418 = load i64, ptr %local.s_val.240
  %t419 = call i64 @"print_f64"(i64 %t418)
  %t420 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.101)
  %t421 = ptrtoint ptr %t420 to i64
  %t422 = inttoptr i64 %t421 to ptr
  call void @intrinsic_print(ptr %t422)
  %t423 = load i64, ptr %local.s_prime.241
  %t424 = call i64 @"print_f64"(i64 %t423)
  %t425 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.102)
  %t426 = ptrtoint ptr %t425 to i64
  %t427 = inttoptr i64 %t426 to ptr
  call void @intrinsic_print(ptr %t427)
  %t428 = load i64, ptr %local.s_double.242
  %t429 = call i64 @"print_f64"(i64 %t428)
  %t430 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.103)
  %t431 = ptrtoint ptr %t430 to i64
  %t432 = inttoptr i64 %t431 to ptr
  call void @intrinsic_print(ptr %t432)
  %t433 = load i64, ptr %local.lr.234
  %t434 = call i64 @"print_f64"(i64 %t433)
  %t435 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.104)
  %t436 = ptrtoint ptr %t435 to i64
  %t437 = inttoptr i64 %t436 to ptr
  call void @intrinsic_print(ptr %t437)
  %t438 = load i64, ptr %local.loss.243
  %t439 = call i64 @"print_f64"(i64 %t438)
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.105)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_println(ptr %t442)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t443 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t444 = load i64, ptr %local.step.233
  %t445 = load i64, ptr %local.shift_step
  %t446 = icmp eq i64 %t444, %t445
  %t447 = zext i1 %t446 to i64
  %t448 = icmp ne i64 %t447, 0
  br i1 %t448, label %then9, label %else9
then9:
  %t449 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.106)
  %t450 = ptrtoint ptr %t449 to i64
  %t451 = inttoptr i64 %t450 to ptr
  call void @intrinsic_print(ptr %t451)
  %t452 = load i64, ptr %local.step.233
  call void @print_i64(i64 %t452)
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.107)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_print(ptr %t455)
  %t456 = load i64, ptr %local.s_val.240
  %t457 = call i64 @"print_f64"(i64 %t456)
  %t458 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.108)
  %t459 = ptrtoint ptr %t458 to i64
  %t460 = inttoptr i64 %t459 to ptr
  call void @intrinsic_print(ptr %t460)
  %t461 = load i64, ptr %local.s_prime.241
  %t462 = call i64 @"print_f64"(i64 %t461)
  %t463 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.109)
  %t464 = ptrtoint ptr %t463 to i64
  %t465 = inttoptr i64 %t464 to ptr
  call void @intrinsic_print(ptr %t465)
  %t466 = load i64, ptr %local.s_double.242
  %t467 = call i64 @"print_f64"(i64 %t466)
  %t468 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.110)
  %t469 = ptrtoint ptr %t468 to i64
  %t470 = inttoptr i64 %t469 to ptr
  call void @intrinsic_print(ptr %t470)
  %t471 = load i64, ptr %local.lr.234
  %t472 = call i64 @"print_f64"(i64 %t471)
  %t473 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.111)
  %t474 = ptrtoint ptr %t473 to i64
  %t475 = inttoptr i64 %t474 to ptr
  call void @intrinsic_print(ptr %t475)
  %t476 = load i64, ptr %local.loss.243
  %t477 = call i64 @"print_f64"(i64 %t476)
  %t478 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.112)
  %t479 = ptrtoint ptr %t478 to i64
  %t480 = inttoptr i64 %t479 to ptr
  call void @intrinsic_println(ptr %t480)
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t481 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t482 = load i64, ptr %local.step.233
  %t483 = load i64, ptr %local.shift_step
  %t484 = add i64 %t483, 1
  %t485 = icmp eq i64 %t482, %t484
  %t486 = zext i1 %t485 to i64
  %t487 = icmp ne i64 %t486, 0
  br i1 %t487, label %then10, label %else10
then10:
  %t488 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.113)
  %t489 = ptrtoint ptr %t488 to i64
  %t490 = inttoptr i64 %t489 to ptr
  call void @intrinsic_print(ptr %t490)
  %t491 = load i64, ptr %local.step.233
  call void @print_i64(i64 %t491)
  %t492 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.114)
  %t493 = ptrtoint ptr %t492 to i64
  %t494 = inttoptr i64 %t493 to ptr
  call void @intrinsic_print(ptr %t494)
  %t495 = load i64, ptr %local.s_val.240
  %t496 = call i64 @"print_f64"(i64 %t495)
  %t497 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.115)
  %t498 = ptrtoint ptr %t497 to i64
  %t499 = inttoptr i64 %t498 to ptr
  call void @intrinsic_print(ptr %t499)
  %t500 = load i64, ptr %local.s_prime.241
  %t501 = call i64 @"print_f64"(i64 %t500)
  %t502 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.116)
  %t503 = ptrtoint ptr %t502 to i64
  %t504 = inttoptr i64 %t503 to ptr
  call void @intrinsic_print(ptr %t504)
  %t505 = load i64, ptr %local.s_double.242
  %t506 = call i64 @"print_f64"(i64 %t505)
  %t507 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.117)
  %t508 = ptrtoint ptr %t507 to i64
  %t509 = inttoptr i64 %t508 to ptr
  call void @intrinsic_print(ptr %t509)
  %t510 = load i64, ptr %local.lr.234
  %t511 = call i64 @"print_f64"(i64 %t510)
  %t512 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.118)
  %t513 = ptrtoint ptr %t512 to i64
  %t514 = inttoptr i64 %t513 to ptr
  call void @intrinsic_print(ptr %t514)
  %t515 = load i64, ptr %local.loss.243
  %t516 = call i64 @"print_f64"(i64 %t515)
  %t517 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.119)
  %t518 = ptrtoint ptr %t517 to i64
  %t519 = inttoptr i64 %t518 to ptr
  call void @intrinsic_println(ptr %t519)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t520 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t521 = load i64, ptr %local.step.233
  %t522 = load i64, ptr %local.shift_step
  %t523 = add i64 %t522, 5
  %t524 = icmp eq i64 %t521, %t523
  %t525 = zext i1 %t524 to i64
  %t526 = icmp ne i64 %t525, 0
  br i1 %t526, label %then11, label %else11
then11:
  %t527 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.120)
  %t528 = ptrtoint ptr %t527 to i64
  %t529 = inttoptr i64 %t528 to ptr
  call void @intrinsic_print(ptr %t529)
  %t530 = load i64, ptr %local.step.233
  call void @print_i64(i64 %t530)
  %t531 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.121)
  %t532 = ptrtoint ptr %t531 to i64
  %t533 = inttoptr i64 %t532 to ptr
  call void @intrinsic_print(ptr %t533)
  %t534 = load i64, ptr %local.s_val.240
  %t535 = call i64 @"print_f64"(i64 %t534)
  %t536 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.122)
  %t537 = ptrtoint ptr %t536 to i64
  %t538 = inttoptr i64 %t537 to ptr
  call void @intrinsic_print(ptr %t538)
  %t539 = load i64, ptr %local.s_prime.241
  %t540 = call i64 @"print_f64"(i64 %t539)
  %t541 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.123)
  %t542 = ptrtoint ptr %t541 to i64
  %t543 = inttoptr i64 %t542 to ptr
  call void @intrinsic_print(ptr %t543)
  %t544 = load i64, ptr %local.s_double.242
  %t545 = call i64 @"print_f64"(i64 %t544)
  %t546 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.124)
  %t547 = ptrtoint ptr %t546 to i64
  %t548 = inttoptr i64 %t547 to ptr
  call void @intrinsic_print(ptr %t548)
  %t549 = load i64, ptr %local.lr.234
  %t550 = call i64 @"print_f64"(i64 %t549)
  %t551 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.125)
  %t552 = ptrtoint ptr %t551 to i64
  %t553 = inttoptr i64 %t552 to ptr
  call void @intrinsic_print(ptr %t553)
  %t554 = load i64, ptr %local.loss.243
  %t555 = call i64 @"print_f64"(i64 %t554)
  %t556 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.126)
  %t557 = ptrtoint ptr %t556 to i64
  %t558 = inttoptr i64 %t557 to ptr
  call void @intrinsic_println(ptr %t558)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t559 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t560 = load i64, ptr %local.step.233
  %t561 = load i64, ptr %local.shift_step
  %t562 = add i64 %t561, 50
  %t563 = icmp eq i64 %t560, %t562
  %t564 = zext i1 %t563 to i64
  %t565 = icmp ne i64 %t564, 0
  br i1 %t565, label %then12, label %else12
then12:
  %t566 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.127)
  %t567 = ptrtoint ptr %t566 to i64
  %t568 = inttoptr i64 %t567 to ptr
  call void @intrinsic_print(ptr %t568)
  %t569 = load i64, ptr %local.step.233
  call void @print_i64(i64 %t569)
  %t570 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.128)
  %t571 = ptrtoint ptr %t570 to i64
  %t572 = inttoptr i64 %t571 to ptr
  call void @intrinsic_print(ptr %t572)
  %t573 = load i64, ptr %local.s_val.240
  %t574 = call i64 @"print_f64"(i64 %t573)
  %t575 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.129)
  %t576 = ptrtoint ptr %t575 to i64
  %t577 = inttoptr i64 %t576 to ptr
  call void @intrinsic_print(ptr %t577)
  %t578 = load i64, ptr %local.s_prime.241
  %t579 = call i64 @"print_f64"(i64 %t578)
  %t580 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.130)
  %t581 = ptrtoint ptr %t580 to i64
  %t582 = inttoptr i64 %t581 to ptr
  call void @intrinsic_print(ptr %t582)
  %t583 = load i64, ptr %local.lr.234
  %t584 = call i64 @"print_f64"(i64 %t583)
  %t585 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.131)
  %t586 = ptrtoint ptr %t585 to i64
  %t587 = inttoptr i64 %t586 to ptr
  call void @intrinsic_print(ptr %t587)
  %t588 = load i64, ptr %local.loss.243
  %t589 = call i64 @"print_f64"(i64 %t588)
  %t590 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.132)
  %t591 = ptrtoint ptr %t590 to i64
  %t592 = inttoptr i64 %t591 to ptr
  call void @intrinsic_println(ptr %t592)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t593 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t594 = load i64, ptr %local.loss.243
  store i64 %t594, ptr %local.prev_loss.235
  %t595 = load i64, ptr %local.drift.239
  store i64 %t595, ptr %local.prev_drift.236
  %t596 = load i64, ptr %local.s_prime.241
  store i64 %t596, ptr %local.prev_s_prime.238
  %t597 = load i64, ptr %local.s_val.240
  store i64 %t597, ptr %local.prev_s.237
  %t598 = load i64, ptr %local.step.233
  %t599 = add i64 %t598, 1
  store i64 %t599, ptr %local.step.233
  br label %loop4
endloop4:
  %t600 = load i64, ptr %local.loss.243
  ret i64 %t600
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.shift.601 = alloca i64
  %local.total.602 = alloca i64
  %local.base.603 = alloca i64
  %local.loss_fixed.604 = alloca i64
  %local.loss_p.605 = alloca i64
  %local.loss_pd.606 = alloca i64
  %local.loss_pid.607 = alloca i64
  %local.loss_apid.608 = alloca i64
  %t609 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.133)
  %t610 = ptrtoint ptr %t609 to i64
  %t611 = inttoptr i64 %t610 to ptr
  call void @intrinsic_println(ptr %t611)
  %t612 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.134)
  %t613 = ptrtoint ptr %t612 to i64
  %t614 = inttoptr i64 %t613 to ptr
  call void @intrinsic_println(ptr %t614)
  %t615 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.135)
  %t616 = ptrtoint ptr %t615 to i64
  %t617 = inttoptr i64 %t616 to ptr
  call void @intrinsic_println(ptr %t617)
  %t618 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.136)
  %t619 = ptrtoint ptr %t618 to i64
  %t620 = inttoptr i64 %t619 to ptr
  call void @intrinsic_println(ptr %t620)
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.137)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_println(ptr %t623)
  store i64 250, ptr %local.shift.601
  store i64 500, ptr %local.total.602
  %t624 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.138)
  store i64 %t624, ptr %local.base.603
  %t625 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.139)
  %t626 = ptrtoint ptr %t625 to i64
  %t627 = inttoptr i64 %t626 to ptr
  call void @intrinsic_println(ptr %t627)
  %t628 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.140)
  %t629 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.141)
  %t630 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.142)
  %t631 = load i64, ptr %local.base.603
  %t632 = load i64, ptr %local.shift.601
  %t633 = load i64, ptr %local.total.602
  %t634 = call i64 @"train_shifting"(i64 %t628, i64 %t629, i64 %t630, i64 %t631, i64 %t632, i64 %t633)
  store i64 %t634, ptr %local.loss_fixed.604
  %t635 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.143)
  %t636 = ptrtoint ptr %t635 to i64
  %t637 = inttoptr i64 %t636 to ptr
  call void @intrinsic_print(ptr %t637)
  %t638 = load i64, ptr %local.loss_fixed.604
  %t639 = call i64 @"print_f64"(i64 %t638)
  %t640 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.144)
  %t641 = ptrtoint ptr %t640 to i64
  %t642 = inttoptr i64 %t641 to ptr
  call void @intrinsic_println(ptr %t642)
  %t643 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.145)
  %t644 = ptrtoint ptr %t643 to i64
  %t645 = inttoptr i64 %t644 to ptr
  call void @intrinsic_println(ptr %t645)
  %t646 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.146)
  %t647 = ptrtoint ptr %t646 to i64
  %t648 = inttoptr i64 %t647 to ptr
  call void @intrinsic_println(ptr %t648)
  %t649 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.147)
  %t650 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.148)
  %t651 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.149)
  %t652 = load i64, ptr %local.base.603
  %t653 = load i64, ptr %local.shift.601
  %t654 = load i64, ptr %local.total.602
  %t655 = call i64 @"train_shifting"(i64 %t649, i64 %t650, i64 %t651, i64 %t652, i64 %t653, i64 %t654)
  store i64 %t655, ptr %local.loss_p.605
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.150)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_print(ptr %t658)
  %t659 = load i64, ptr %local.loss_p.605
  %t660 = call i64 @"print_f64"(i64 %t659)
  %t661 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.151)
  %t662 = ptrtoint ptr %t661 to i64
  %t663 = inttoptr i64 %t662 to ptr
  call void @intrinsic_println(ptr %t663)
  %t664 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.152)
  %t665 = ptrtoint ptr %t664 to i64
  %t666 = inttoptr i64 %t665 to ptr
  call void @intrinsic_println(ptr %t666)
  %t667 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.153)
  %t668 = ptrtoint ptr %t667 to i64
  %t669 = inttoptr i64 %t668 to ptr
  call void @intrinsic_println(ptr %t669)
  %t670 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.154)
  %t671 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.155)
  %t672 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.156)
  %t673 = load i64, ptr %local.base.603
  %t674 = load i64, ptr %local.shift.601
  %t675 = load i64, ptr %local.total.602
  %t676 = call i64 @"train_shifting"(i64 %t670, i64 %t671, i64 %t672, i64 %t673, i64 %t674, i64 %t675)
  store i64 %t676, ptr %local.loss_pd.606
  %t677 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.157)
  %t678 = ptrtoint ptr %t677 to i64
  %t679 = inttoptr i64 %t678 to ptr
  call void @intrinsic_print(ptr %t679)
  %t680 = load i64, ptr %local.loss_pd.606
  %t681 = call i64 @"print_f64"(i64 %t680)
  %t682 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.158)
  %t683 = ptrtoint ptr %t682 to i64
  %t684 = inttoptr i64 %t683 to ptr
  call void @intrinsic_println(ptr %t684)
  %t685 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.159)
  %t686 = ptrtoint ptr %t685 to i64
  %t687 = inttoptr i64 %t686 to ptr
  call void @intrinsic_println(ptr %t687)
  %t688 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.160)
  %t689 = ptrtoint ptr %t688 to i64
  %t690 = inttoptr i64 %t689 to ptr
  call void @intrinsic_println(ptr %t690)
  %t691 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.161)
  %t692 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.162)
  %t693 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.163)
  %t694 = load i64, ptr %local.base.603
  %t695 = load i64, ptr %local.shift.601
  %t696 = load i64, ptr %local.total.602
  %t697 = call i64 @"train_shifting"(i64 %t691, i64 %t692, i64 %t693, i64 %t694, i64 %t695, i64 %t696)
  store i64 %t697, ptr %local.loss_pid.607
  %t698 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.164)
  %t699 = ptrtoint ptr %t698 to i64
  %t700 = inttoptr i64 %t699 to ptr
  call void @intrinsic_print(ptr %t700)
  %t701 = load i64, ptr %local.loss_pid.607
  %t702 = call i64 @"print_f64"(i64 %t701)
  %t703 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.165)
  %t704 = ptrtoint ptr %t703 to i64
  %t705 = inttoptr i64 %t704 to ptr
  call void @intrinsic_println(ptr %t705)
  %t706 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.166)
  %t707 = ptrtoint ptr %t706 to i64
  %t708 = inttoptr i64 %t707 to ptr
  call void @intrinsic_println(ptr %t708)
  %t709 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.167)
  %t710 = ptrtoint ptr %t709 to i64
  %t711 = inttoptr i64 %t710 to ptr
  call void @intrinsic_println(ptr %t711)
  %t712 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.168)
  %t713 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.169)
  %t714 = call i64 @f64_parse(ptr @.str.exp_pid_regime_shift.170)
  %t715 = load i64, ptr %local.base.603
  %t716 = load i64, ptr %local.shift.601
  %t717 = load i64, ptr %local.total.602
  %t718 = call i64 @"train_shifting"(i64 %t712, i64 %t713, i64 %t714, i64 %t715, i64 %t716, i64 %t717)
  store i64 %t718, ptr %local.loss_apid.608
  %t719 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.171)
  %t720 = ptrtoint ptr %t719 to i64
  %t721 = inttoptr i64 %t720 to ptr
  call void @intrinsic_print(ptr %t721)
  %t722 = load i64, ptr %local.loss_apid.608
  %t723 = call i64 @"print_f64"(i64 %t722)
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.172)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_println(ptr %t726)
  %t727 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.173)
  %t728 = ptrtoint ptr %t727 to i64
  %t729 = inttoptr i64 %t728 to ptr
  call void @intrinsic_println(ptr %t729)
  %t730 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.174)
  %t731 = ptrtoint ptr %t730 to i64
  %t732 = inttoptr i64 %t731 to ptr
  call void @intrinsic_println(ptr %t732)
  %t733 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.175)
  %t734 = ptrtoint ptr %t733 to i64
  %t735 = inttoptr i64 %t734 to ptr
  call void @intrinsic_print(ptr %t735)
  %t736 = load i64, ptr %local.loss_fixed.604
  %t737 = call i64 @"print_f64"(i64 %t736)
  %t738 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.176)
  %t739 = ptrtoint ptr %t738 to i64
  %t740 = inttoptr i64 %t739 to ptr
  call void @intrinsic_println(ptr %t740)
  %t741 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.177)
  %t742 = ptrtoint ptr %t741 to i64
  %t743 = inttoptr i64 %t742 to ptr
  call void @intrinsic_print(ptr %t743)
  %t744 = load i64, ptr %local.loss_p.605
  %t745 = call i64 @"print_f64"(i64 %t744)
  %t746 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.178)
  %t747 = ptrtoint ptr %t746 to i64
  %t748 = inttoptr i64 %t747 to ptr
  call void @intrinsic_println(ptr %t748)
  %t749 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.179)
  %t750 = ptrtoint ptr %t749 to i64
  %t751 = inttoptr i64 %t750 to ptr
  call void @intrinsic_print(ptr %t751)
  %t752 = load i64, ptr %local.loss_pd.606
  %t753 = call i64 @"print_f64"(i64 %t752)
  %t754 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.180)
  %t755 = ptrtoint ptr %t754 to i64
  %t756 = inttoptr i64 %t755 to ptr
  call void @intrinsic_println(ptr %t756)
  %t757 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.181)
  %t758 = ptrtoint ptr %t757 to i64
  %t759 = inttoptr i64 %t758 to ptr
  call void @intrinsic_print(ptr %t759)
  %t760 = load i64, ptr %local.loss_pid.607
  %t761 = call i64 @"print_f64"(i64 %t760)
  %t762 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.182)
  %t763 = ptrtoint ptr %t762 to i64
  %t764 = inttoptr i64 %t763 to ptr
  call void @intrinsic_println(ptr %t764)
  %t765 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.183)
  %t766 = ptrtoint ptr %t765 to i64
  %t767 = inttoptr i64 %t766 to ptr
  call void @intrinsic_print(ptr %t767)
  %t768 = load i64, ptr %local.loss_apid.608
  %t769 = call i64 @"print_f64"(i64 %t768)
  %t770 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.184)
  %t771 = ptrtoint ptr %t770 to i64
  %t772 = inttoptr i64 %t771 to ptr
  call void @intrinsic_println(ptr %t772)
  %t773 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.185)
  %t774 = ptrtoint ptr %t773 to i64
  %t775 = inttoptr i64 %t774 to ptr
  call void @intrinsic_println(ptr %t775)
  %t776 = load i64, ptr %local.loss_pid.607
  %t777 = load i64, ptr %local.loss_p.605
  %t778 = call i64 @"sx_f64_lt"(i64 %t776, i64 %t777)
  %t779 = icmp ne i64 %t778, 0
  br i1 %t779, label %then13, label %else13
then13:
  %t780 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.186)
  %t781 = ptrtoint ptr %t780 to i64
  %t782 = inttoptr i64 %t781 to ptr
  call void @intrinsic_println(ptr %t782)
  %t783 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.187)
  %t784 = ptrtoint ptr %t783 to i64
  %t785 = inttoptr i64 %t784 to ptr
  call void @intrinsic_println(ptr %t785)
  %t786 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.188)
  %t787 = ptrtoint ptr %t786 to i64
  %t788 = inttoptr i64 %t787 to ptr
  call void @intrinsic_println(ptr %t788)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t789 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t790 = load i64, ptr %local.loss_pd.606
  %t791 = load i64, ptr %local.loss_fixed.604
  %t792 = call i64 @"sx_f64_lt"(i64 %t790, i64 %t791)
  %t793 = icmp ne i64 %t792, 0
  br i1 %t793, label %then14, label %else14
then14:
  %t794 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.189)
  %t795 = ptrtoint ptr %t794 to i64
  %t796 = inttoptr i64 %t795 to ptr
  call void @intrinsic_println(ptr %t796)
  %t797 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.190)
  %t798 = ptrtoint ptr %t797 to i64
  %t799 = inttoptr i64 %t798 to ptr
  call void @intrinsic_println(ptr %t799)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t800 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t801 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.191)
  %t802 = ptrtoint ptr %t801 to i64
  %t803 = inttoptr i64 %t802 to ptr
  call void @intrinsic_println(ptr %t803)
  %t804 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.192)
  %t805 = ptrtoint ptr %t804 to i64
  %t806 = inttoptr i64 %t805 to ptr
  call void @intrinsic_println(ptr %t806)
  %t807 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.193)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_println(ptr %t809)
  %t810 = call ptr @intrinsic_string_new(ptr @.str.exp_pid_regime_shift.194)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_println(ptr %t812)
  ret i64 0
}


; String constants
@.str.exp_pid_regime_shift.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.6 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_regime_shift.7 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_regime_shift.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.12 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.13 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.14 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.16 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.17 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.18 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.19 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.20 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.21 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.22 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.24 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.25 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.26 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.28 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.29 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.30 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.32 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_regime_shift.33 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_regime_shift.34 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.35 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.36 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.37 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.38 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.39 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.40 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.41 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.42 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.43 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.44 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.45 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.46 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.47 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.49 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.51 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.52 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_pid_regime_shift.53 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.55 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.58 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.62 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.65 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_regime_shift.66 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.68 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.69 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.70 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.71 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.72 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.73 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.74 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.75 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.76 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.77 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.78 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.79 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.80 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.81 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.82 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_pid_regime_shift.83 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_pid_regime_shift.84 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.85 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.87 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.88 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.89 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.90 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.91 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.92 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.93 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_pid_regime_shift.94 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.95 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.96 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.97 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_pid_regime_shift.98 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_pid_regime_shift.99 = private unnamed_addr constant [10 x i8] c"    step \00"
@.str.exp_pid_regime_shift.100 = private unnamed_addr constant [5 x i8] c": S=\00"
@.str.exp_pid_regime_shift.101 = private unnamed_addr constant [5 x i8] c" S'=\00"
@.str.exp_pid_regime_shift.102 = private unnamed_addr constant [6 x i8] c" S''=\00"
@.str.exp_pid_regime_shift.103 = private unnamed_addr constant [5 x i8] c" lr=\00"
@.str.exp_pid_regime_shift.104 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_pid_regime_shift.105 = private unnamed_addr constant [17 x i8] c"  (before shift)\00"
@.str.exp_pid_regime_shift.106 = private unnamed_addr constant [10 x i8] c"    step \00"
@.str.exp_pid_regime_shift.107 = private unnamed_addr constant [5 x i8] c": S=\00"
@.str.exp_pid_regime_shift.108 = private unnamed_addr constant [5 x i8] c" S'=\00"
@.str.exp_pid_regime_shift.109 = private unnamed_addr constant [6 x i8] c" S''=\00"
@.str.exp_pid_regime_shift.110 = private unnamed_addr constant [5 x i8] c" lr=\00"
@.str.exp_pid_regime_shift.111 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_pid_regime_shift.112 = private unnamed_addr constant [14 x i8] c"  ** SHIFT **\00"
@.str.exp_pid_regime_shift.113 = private unnamed_addr constant [10 x i8] c"    step \00"
@.str.exp_pid_regime_shift.114 = private unnamed_addr constant [5 x i8] c": S=\00"
@.str.exp_pid_regime_shift.115 = private unnamed_addr constant [5 x i8] c" S'=\00"
@.str.exp_pid_regime_shift.116 = private unnamed_addr constant [6 x i8] c" S''=\00"
@.str.exp_pid_regime_shift.117 = private unnamed_addr constant [5 x i8] c" lr=\00"
@.str.exp_pid_regime_shift.118 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_pid_regime_shift.119 = private unnamed_addr constant [16 x i8] c"  (after shift)\00"
@.str.exp_pid_regime_shift.120 = private unnamed_addr constant [10 x i8] c"    step \00"
@.str.exp_pid_regime_shift.121 = private unnamed_addr constant [5 x i8] c": S=\00"
@.str.exp_pid_regime_shift.122 = private unnamed_addr constant [5 x i8] c" S'=\00"
@.str.exp_pid_regime_shift.123 = private unnamed_addr constant [6 x i8] c" S''=\00"
@.str.exp_pid_regime_shift.124 = private unnamed_addr constant [5 x i8] c" lr=\00"
@.str.exp_pid_regime_shift.125 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_pid_regime_shift.126 = private unnamed_addr constant [18 x i8] c"  (5 steps after)\00"
@.str.exp_pid_regime_shift.127 = private unnamed_addr constant [10 x i8] c"    step \00"
@.str.exp_pid_regime_shift.128 = private unnamed_addr constant [5 x i8] c": S=\00"
@.str.exp_pid_regime_shift.129 = private unnamed_addr constant [5 x i8] c" S'=\00"
@.str.exp_pid_regime_shift.130 = private unnamed_addr constant [5 x i8] c" lr=\00"
@.str.exp_pid_regime_shift.131 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_pid_regime_shift.132 = private unnamed_addr constant [13 x i8] c"  (50 after)\00"
@.str.exp_pid_regime_shift.133 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_pid_regime_shift.134 = private unnamed_addr constant [45 x i8] c"#  PID ON REGIME-SHIFTING LANDSCAPE        #\00"
@.str.exp_pid_regime_shift.135 = private unnamed_addr constant [45 x i8] c"#  Targets change abruptly at step 250     #\00"
@.str.exp_pid_regime_shift.136 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_pid_regime_shift.137 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.138 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_pid_regime_shift.139 = private unnamed_addr constant [40 x i8] c"--- Fixed lr = 0.01 (no adaptation) ---\00"
@.str.exp_pid_regime_shift.140 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.141 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.143 = private unnamed_addr constant [15 x i8] c"  Final loss: \00"
@.str.exp_pid_regime_shift.144 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.145 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.146 = private unnamed_addr constant [40 x i8] c"--- P-only: lr = base * (1 + 0.5*S) ---\00"
@.str.exp_pid_regime_shift.147 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_regime_shift.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.149 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.150 = private unnamed_addr constant [15 x i8] c"  Final loss: \00"
@.str.exp_pid_regime_shift.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.152 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.153 = private unnamed_addr constant [45 x i8] c"--- PD: lr = base * (1 + 0.5*S + 1.0*S') ---\00"
@.str.exp_pid_regime_shift.154 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_regime_shift.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.156 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_pid_regime_shift.157 = private unnamed_addr constant [15 x i8] c"  Final loss: \00"
@.str.exp_pid_regime_shift.158 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.159 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.160 = private unnamed_addr constant [56 x i8] c"--- PID: lr = base * (1 + 0.5*S + 1.0*S' + 0.5*S'') ---\00"
@.str.exp_pid_regime_shift.161 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_regime_shift.162 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.163 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_pid_regime_shift.164 = private unnamed_addr constant [15 x i8] c"  Final loss: \00"
@.str.exp_pid_regime_shift.165 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.166 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.167 = private unnamed_addr constant [67 x i8] c"--- Aggressive PID: lr = base * (1 + 1.0*S + 2.0*S' + 1.0*S'') ---\00"
@.str.exp_pid_regime_shift.168 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.169 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_pid_regime_shift.170 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_pid_regime_shift.171 = private unnamed_addr constant [15 x i8] c"  Final loss: \00"
@.str.exp_pid_regime_shift.172 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.173 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.174 = private unnamed_addr constant [19 x i8] c"=== COMPARISON ===\00"
@.str.exp_pid_regime_shift.175 = private unnamed_addr constant [19 x i8] c"  Fixed:          \00"
@.str.exp_pid_regime_shift.176 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.177 = private unnamed_addr constant [19 x i8] c"  P (S only):     \00"
@.str.exp_pid_regime_shift.178 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.179 = private unnamed_addr constant [19 x i8] c"  PD (S + S'):    \00"
@.str.exp_pid_regime_shift.180 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.181 = private unnamed_addr constant [20 x i8] c"  PID (S+S'+S''):  \00"
@.str.exp_pid_regime_shift.182 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.183 = private unnamed_addr constant [19 x i8] c"  Aggressive PID: \00"
@.str.exp_pid_regime_shift.184 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.185 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.186 = private unnamed_addr constant [48 x i8] c"  FINDING: PID (with S'') BEATS P-only (S only)\00"
@.str.exp_pid_regime_shift.187 = private unnamed_addr constant [50 x i8] c"  The derivative terms provide measurable benefit\00"
@.str.exp_pid_regime_shift.188 = private unnamed_addr constant [42 x i8] c"  when the landscape shifts mid-training.\00"
@.str.exp_pid_regime_shift.189 = private unnamed_addr constant [40 x i8] c"  FINDING: PD controller BEATS fixed lr\00"
@.str.exp_pid_regime_shift.190 = private unnamed_addr constant [38 x i8] c"  S' detects the regime shift faster.\00"
@.str.exp_pid_regime_shift.191 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_pid_regime_shift.192 = private unnamed_addr constant [41 x i8] c"  KEY: On stable landscapes, P suffices.\00"
@.str.exp_pid_regime_shift.193 = private unnamed_addr constant [43 x i8] c"  On SHIFTING landscapes, D and DD matter.\00"
@.str.exp_pid_regime_shift.194 = private unnamed_addr constant [48 x i8] c"  The meta-gradient discovers which terms help.\00"
