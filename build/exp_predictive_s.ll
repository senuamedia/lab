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
  %t1 = call i64 @f64_parse(ptr @.str.exp_predictive_s.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_predictive_s.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"logistic"(i64 %r, i64 %x) nounwind {
entry:
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t9 = load i64, ptr %local.r
  %t10 = load i64, ptr %local.x
  %t11 = call i64 @"sx_f64_mul"(i64 %t9, i64 %t10)
  %t12 = call i64 @f64_parse(ptr @.str.exp_predictive_s.2)
  %t13 = load i64, ptr %local.x
  %t14 = call i64 @"sx_f64_sub"(i64 %t12, i64 %t13)
  %t15 = call i64 @"sx_f64_mul"(i64 %t11, i64 %t14)
  ret i64 %t15
}

define i64 @"clamp_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t16 = load i64, ptr %local.x
  %t17 = call i64 @f64_parse(ptr @.str.exp_predictive_s.3)
  %t18 = call i64 @"sx_f64_gt"(i64 %t16, i64 %t17)
  %t19 = icmp ne i64 %t18, 0
  br i1 %t19, label %then1, label %else1
then1:
  %t20 = call i64 @f64_parse(ptr @.str.exp_predictive_s.4)
  ret i64 %t20
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t21 = phi i64 [ 0, %else1_end ]
  %t22 = load i64, ptr %local.x
  %t23 = call i64 @f64_parse(ptr @.str.exp_predictive_s.5)
  %t24 = xor i64 %t23, -9223372036854775808
  %t25 = call i64 @"sx_f64_lt"(i64 %t22, i64 %t24)
  %t26 = icmp ne i64 %t25, 0
  br i1 %t26, label %then2, label %else2
then2:
  %t27 = call i64 @f64_parse(ptr @.str.exp_predictive_s.6)
  %t28 = xor i64 %t27, -9223372036854775808
  ret i64 %t28
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t29 = phi i64 [ 0, %else2_end ]
  %t30 = load i64, ptr %local.x
  ret i64 %t30
}

define i64 @"window_drift"(i64 %r, i64 %x_start, i64 %win_size) nounwind {
entry:
  %local.x.31 = alloca i64
  %local.sum.32 = alloca i64
  %local.prev.33 = alloca i64
  %local.i.34 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.x_start = alloca i64
  store i64 %x_start, ptr %local.x_start
  %local.win_size = alloca i64
  store i64 %win_size, ptr %local.win_size
  %t35 = load i64, ptr %local.x_start
  store i64 %t35, ptr %local.x.31
  %t36 = call i64 @f64_parse(ptr @.str.exp_predictive_s.7)
  store i64 %t36, ptr %local.sum.32
  %t37 = load i64, ptr %local.x.31
  store i64 %t37, ptr %local.prev.33
  store i64 0, ptr %local.i.34
  br label %loop3
loop3:
  %t38 = load i64, ptr %local.i.34
  %t39 = load i64, ptr %local.win_size
  %t40 = icmp slt i64 %t38, %t39
  %t41 = zext i1 %t40 to i64
  %t42 = icmp ne i64 %t41, 0
  br i1 %t42, label %body3, label %endloop3
body3:
  %t43 = load i64, ptr %local.x.31
  store i64 %t43, ptr %local.prev.33
  %t44 = load i64, ptr %local.r
  %t45 = load i64, ptr %local.x.31
  %t46 = call i64 @"logistic"(i64 %t44, i64 %t45)
  store i64 %t46, ptr %local.x.31
  %t47 = load i64, ptr %local.sum.32
  %t48 = load i64, ptr %local.x.31
  %t49 = load i64, ptr %local.prev.33
  %t50 = call i64 @"sx_f64_sub"(i64 %t48, i64 %t49)
  %t51 = call i64 @"abs_f64"(i64 %t50)
  %t52 = call i64 @"sx_f64_add"(i64 %t47, i64 %t51)
  store i64 %t52, ptr %local.sum.32
  %t53 = load i64, ptr %local.i.34
  %t54 = add i64 %t53, 1
  store i64 %t54, ptr %local.i.34
  br label %loop3
endloop3:
  %t55 = load i64, ptr %local.sum.32
  %t56 = load i64, ptr %local.win_size
  %t57 = call i64 @"sx_int_to_f64"(i64 %t56)
  %t58 = call i64 @"sx_f64_div"(i64 %t55, i64 %t57)
  ret i64 %t58
}

define i64 @"logistic_transient"(i64 %r) nounwind {
entry:
  %local.x.59 = alloca i64
  %local.i.60 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t61 = call i64 @f64_parse(ptr @.str.exp_predictive_s.8)
  store i64 %t61, ptr %local.x.59
  store i64 0, ptr %local.i.60
  br label %loop4
loop4:
  %t62 = load i64, ptr %local.i.60
  %t63 = icmp slt i64 %t62, 500
  %t64 = zext i1 %t63 to i64
  %t65 = icmp ne i64 %t64, 0
  br i1 %t65, label %body4, label %endloop4
body4:
  %t66 = load i64, ptr %local.r
  %t67 = load i64, ptr %local.x.59
  %t68 = call i64 @"logistic"(i64 %t66, i64 %t67)
  store i64 %t68, ptr %local.x.59
  %t69 = load i64, ptr %local.i.60
  %t70 = add i64 %t69, 1
  store i64 %t70, ptr %local.i.60
  br label %loop4
endloop4:
  %t71 = load i64, ptr %local.x.59
  ret i64 %t71
}

define i64 @"s_series_val"(i64 %r, i64 %query_idx) nounwind {
entry:
  %local.x.72 = alloca i64
  %local.prev_drift.73 = alloca i64
  %local.curr_drift.74 = alloca i64
  %local.s_val.75 = alloca i64
  %local.win.76 = alloca i64
  %local.j.77 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.query_idx = alloca i64
  store i64 %query_idx, ptr %local.query_idx
  %t78 = load i64, ptr %local.r
  %t79 = call i64 @"logistic_transient"(i64 %t78)
  store i64 %t79, ptr %local.x.72
  %t80 = call i64 @f64_parse(ptr @.str.exp_predictive_s.9)
  store i64 %t80, ptr %local.prev_drift.73
  %t81 = call i64 @f64_parse(ptr @.str.exp_predictive_s.10)
  store i64 %t81, ptr %local.curr_drift.74
  %t82 = call i64 @f64_parse(ptr @.str.exp_predictive_s.11)
  store i64 %t82, ptr %local.s_val.75
  store i64 0, ptr %local.win.76
  %t83 = load i64, ptr %local.r
  %t84 = load i64, ptr %local.x.72
  %t85 = call i64 @"window_drift"(i64 %t83, i64 %t84, i64 50)
  store i64 %t85, ptr %local.prev_drift.73
  store i64 0, ptr %local.j.77
  br label %loop5
loop5:
  %t86 = load i64, ptr %local.j.77
  %t87 = icmp slt i64 %t86, 50
  %t88 = zext i1 %t87 to i64
  %t89 = icmp ne i64 %t88, 0
  br i1 %t89, label %body5, label %endloop5
body5:
  %t90 = load i64, ptr %local.r
  %t91 = load i64, ptr %local.x.72
  %t92 = call i64 @"logistic"(i64 %t90, i64 %t91)
  store i64 %t92, ptr %local.x.72
  %t93 = load i64, ptr %local.j.77
  %t94 = add i64 %t93, 1
  store i64 %t94, ptr %local.j.77
  br label %loop5
endloop5:
  br label %loop6
loop6:
  %t95 = load i64, ptr %local.win.76
  %t96 = load i64, ptr %local.query_idx
  %t97 = icmp sle i64 %t95, %t96
  %t98 = zext i1 %t97 to i64
  %t99 = icmp ne i64 %t98, 0
  br i1 %t99, label %body6, label %endloop6
body6:
  %t100 = load i64, ptr %local.r
  %t101 = load i64, ptr %local.x.72
  %t102 = call i64 @"window_drift"(i64 %t100, i64 %t101, i64 50)
  store i64 %t102, ptr %local.curr_drift.74
  store i64 0, ptr %local.j.77
  br label %loop7
loop7:
  %t103 = load i64, ptr %local.j.77
  %t104 = icmp slt i64 %t103, 50
  %t105 = zext i1 %t104 to i64
  %t106 = icmp ne i64 %t105, 0
  br i1 %t106, label %body7, label %endloop7
body7:
  %t107 = load i64, ptr %local.r
  %t108 = load i64, ptr %local.x.72
  %t109 = call i64 @"logistic"(i64 %t107, i64 %t108)
  store i64 %t109, ptr %local.x.72
  %t110 = load i64, ptr %local.j.77
  %t111 = add i64 %t110, 1
  store i64 %t111, ptr %local.j.77
  br label %loop7
endloop7:
  %t112 = load i64, ptr %local.prev_drift.73
  %t113 = call i64 @f64_parse(ptr @.str.exp_predictive_s.12)
  %t114 = call i64 @"sx_f64_gt"(i64 %t112, i64 %t113)
  %t115 = icmp ne i64 %t114, 0
  br i1 %t115, label %then8, label %else8
then8:
  %t116 = call i64 @f64_parse(ptr @.str.exp_predictive_s.13)
  %t117 = load i64, ptr %local.curr_drift.74
  %t118 = load i64, ptr %local.prev_drift.73
  %t119 = call i64 @"sx_f64_div"(i64 %t117, i64 %t118)
  %t120 = call i64 @"sx_f64_sub"(i64 %t116, i64 %t119)
  store i64 %t120, ptr %local.s_val.75
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t121 = call i64 @f64_parse(ptr @.str.exp_predictive_s.14)
  store i64 %t121, ptr %local.s_val.75
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t122 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t123 = load i64, ptr %local.curr_drift.74
  store i64 %t123, ptr %local.prev_drift.73
  %t124 = load i64, ptr %local.win.76
  %t125 = add i64 %t124, 1
  store i64 %t125, ptr %local.win.76
  br label %loop6
endloop6:
  %t126 = load i64, ptr %local.s_val.75
  ret i64 %t126
}

define i64 @"predict_s_rmse"(i64 %r, i64 %a, i64 %b, i64 %c, i64 %d, i64 %phase) nounwind {
entry:
  %local.start_w.127 = alloca i64
  %local.end_w.128 = alloca i64
  %local.sse.129 = alloca i64
  %local.count.130 = alloca i64
  %local.w.131 = alloca i64
  %local.s0.132 = alloca i64
  %local.s1.133 = alloca i64
  %local.s2.134 = alloca i64
  %local.s_actual.135 = alloca i64
  %local.sp.136 = alloca i64
  %local.spp.137 = alloca i64
  %local.pred.138 = alloca i64
  %local.err.139 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %local.d = alloca i64
  store i64 %d, ptr %local.d
  %local.phase = alloca i64
  store i64 %phase, ptr %local.phase
  store i64 2, ptr %local.start_w.127
  store i64 101, ptr %local.end_w.128
  %t140 = load i64, ptr %local.phase
  %t141 = icmp eq i64 %t140, 1
  %t142 = zext i1 %t141 to i64
  %t143 = icmp ne i64 %t142, 0
  br i1 %t143, label %then9, label %else9
then9:
  store i64 102, ptr %local.start_w.127
  store i64 199, ptr %local.end_w.128
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t144 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t145 = call i64 @f64_parse(ptr @.str.exp_predictive_s.15)
  store i64 %t145, ptr %local.sse.129
  store i64 0, ptr %local.count.130
  %t146 = load i64, ptr %local.start_w.127
  store i64 %t146, ptr %local.w.131
  br label %loop10
loop10:
  %t147 = load i64, ptr %local.w.131
  %t148 = load i64, ptr %local.end_w.128
  %t149 = icmp slt i64 %t147, %t148
  %t150 = zext i1 %t149 to i64
  %t151 = icmp ne i64 %t150, 0
  br i1 %t151, label %body10, label %endloop10
body10:
  %t152 = load i64, ptr %local.r
  %t153 = load i64, ptr %local.w.131
  %t154 = sub i64 %t153, 2
  %t155 = call i64 @"s_series_val"(i64 %t152, i64 %t154)
  store i64 %t155, ptr %local.s0.132
  %t156 = load i64, ptr %local.r
  %t157 = load i64, ptr %local.w.131
  %t158 = sub i64 %t157, 1
  %t159 = call i64 @"s_series_val"(i64 %t156, i64 %t158)
  store i64 %t159, ptr %local.s1.133
  %t160 = load i64, ptr %local.r
  %t161 = load i64, ptr %local.w.131
  %t162 = call i64 @"s_series_val"(i64 %t160, i64 %t161)
  store i64 %t162, ptr %local.s2.134
  %t163 = load i64, ptr %local.r
  %t164 = load i64, ptr %local.w.131
  %t165 = add i64 %t164, 1
  %t166 = call i64 @"s_series_val"(i64 %t163, i64 %t165)
  store i64 %t166, ptr %local.s_actual.135
  %t167 = load i64, ptr %local.s1.133
  %t168 = load i64, ptr %local.s0.132
  %t169 = call i64 @"sx_f64_sub"(i64 %t167, i64 %t168)
  store i64 %t169, ptr %local.sp.136
  %t170 = load i64, ptr %local.s2.134
  %t171 = call i64 @f64_parse(ptr @.str.exp_predictive_s.16)
  %t172 = load i64, ptr %local.s1.133
  %t173 = call i64 @"sx_f64_mul"(i64 %t171, i64 %t172)
  %t174 = call i64 @"sx_f64_sub"(i64 %t170, i64 %t173)
  %t175 = load i64, ptr %local.s0.132
  %t176 = call i64 @"sx_f64_add"(i64 %t174, i64 %t175)
  store i64 %t176, ptr %local.spp.137
  %t177 = load i64, ptr %local.a
  %t178 = load i64, ptr %local.s2.134
  %t179 = call i64 @"sx_f64_mul"(i64 %t177, i64 %t178)
  %t180 = load i64, ptr %local.b
  %t181 = load i64, ptr %local.sp.136
  %t182 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t181)
  %t183 = call i64 @"sx_f64_add"(i64 %t179, i64 %t182)
  %t184 = load i64, ptr %local.c
  %t185 = load i64, ptr %local.spp.137
  %t186 = call i64 @"sx_f64_mul"(i64 %t184, i64 %t185)
  %t187 = call i64 @"sx_f64_add"(i64 %t183, i64 %t186)
  %t188 = load i64, ptr %local.d
  %t189 = call i64 @"sx_f64_add"(i64 %t187, i64 %t188)
  store i64 %t189, ptr %local.pred.138
  %t190 = load i64, ptr %local.pred.138
  %t191 = load i64, ptr %local.s_actual.135
  %t192 = call i64 @"sx_f64_sub"(i64 %t190, i64 %t191)
  store i64 %t192, ptr %local.err.139
  %t193 = load i64, ptr %local.sse.129
  %t194 = load i64, ptr %local.err.139
  %t195 = load i64, ptr %local.err.139
  %t196 = call i64 @"sx_f64_mul"(i64 %t194, i64 %t195)
  %t197 = call i64 @"sx_f64_add"(i64 %t193, i64 %t196)
  store i64 %t197, ptr %local.sse.129
  %t198 = load i64, ptr %local.count.130
  %t199 = add i64 %t198, 1
  store i64 %t199, ptr %local.count.130
  %t200 = load i64, ptr %local.w.131
  %t201 = add i64 %t200, 5
  store i64 %t201, ptr %local.w.131
  br label %loop10
endloop10:
  %t202 = load i64, ptr %local.count.130
  %t203 = icmp sgt i64 %t202, 0
  %t204 = zext i1 %t203 to i64
  %t205 = icmp ne i64 %t204, 0
  br i1 %t205, label %then11, label %else11
then11:
  %t206 = load i64, ptr %local.sse.129
  %t207 = load i64, ptr %local.count.130
  %t208 = call i64 @"sx_int_to_f64"(i64 %t207)
  %t209 = call i64 @"sx_f64_div"(i64 %t206, i64 %t208)
  %t210 = call i64 @"sqrt_f64"(i64 %t209)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t211 = call i64 @f64_parse(ptr @.str.exp_predictive_s.17)
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t212 = phi i64 [ %t210, %then11_end ], [ %t211, %else11_end ]
  ret i64 %t212
}

define i64 @"learn_coeff_a"(i64 %r) nounwind {
entry:
  %local.best_a.213 = alloca i64
  %local.best_rmse.214 = alloca i64
  %local.ai.215 = alloca i64
  %local.a_try.216 = alloca i64
  %local.rmse.217 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t218 = call i64 @f64_parse(ptr @.str.exp_predictive_s.18)
  store i64 %t218, ptr %local.best_a.213
  %t219 = call i64 @f64_parse(ptr @.str.exp_predictive_s.19)
  store i64 %t219, ptr %local.best_rmse.214
  %t220 = sub i64 0, 4
  store i64 %t220, ptr %local.ai.215
  br label %loop12
loop12:
  %t221 = load i64, ptr %local.ai.215
  %t222 = icmp sle i64 %t221, 4
  %t223 = zext i1 %t222 to i64
  %t224 = icmp ne i64 %t223, 0
  br i1 %t224, label %body12, label %endloop12
body12:
  %t225 = load i64, ptr %local.ai.215
  %t226 = call i64 @"sx_int_to_f64"(i64 %t225)
  %t227 = call i64 @f64_parse(ptr @.str.exp_predictive_s.20)
  %t228 = call i64 @"sx_f64_mul"(i64 %t226, i64 %t227)
  store i64 %t228, ptr %local.a_try.216
  %t229 = load i64, ptr %local.r
  %t230 = load i64, ptr %local.a_try.216
  %t231 = call i64 @f64_parse(ptr @.str.exp_predictive_s.21)
  %t232 = call i64 @f64_parse(ptr @.str.exp_predictive_s.22)
  %t233 = call i64 @f64_parse(ptr @.str.exp_predictive_s.23)
  %t234 = call i64 @"predict_s_rmse"(i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233, i64 0)
  store i64 %t234, ptr %local.rmse.217
  %t235 = load i64, ptr %local.rmse.217
  %t236 = load i64, ptr %local.best_rmse.214
  %t237 = call i64 @"sx_f64_lt"(i64 %t235, i64 %t236)
  %t238 = icmp ne i64 %t237, 0
  br i1 %t238, label %then13, label %else13
then13:
  %t239 = load i64, ptr %local.rmse.217
  store i64 %t239, ptr %local.best_rmse.214
  %t240 = load i64, ptr %local.a_try.216
  store i64 %t240, ptr %local.best_a.213
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t241 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t242 = load i64, ptr %local.ai.215
  %t243 = add i64 %t242, 1
  store i64 %t243, ptr %local.ai.215
  br label %loop12
endloop12:
  %t244 = load i64, ptr %local.best_a.213
  ret i64 %t244
}

define i64 @"learn_coeff_b"(i64 %r, i64 %a) nounwind {
entry:
  %local.best_b.245 = alloca i64
  %local.best_rmse.246 = alloca i64
  %local.bi.247 = alloca i64
  %local.b_try.248 = alloca i64
  %local.rmse.249 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %t250 = call i64 @f64_parse(ptr @.str.exp_predictive_s.24)
  store i64 %t250, ptr %local.best_b.245
  %t251 = call i64 @f64_parse(ptr @.str.exp_predictive_s.25)
  store i64 %t251, ptr %local.best_rmse.246
  %t252 = sub i64 0, 4
  store i64 %t252, ptr %local.bi.247
  br label %loop14
loop14:
  %t253 = load i64, ptr %local.bi.247
  %t254 = icmp sle i64 %t253, 4
  %t255 = zext i1 %t254 to i64
  %t256 = icmp ne i64 %t255, 0
  br i1 %t256, label %body14, label %endloop14
body14:
  %t257 = load i64, ptr %local.bi.247
  %t258 = call i64 @"sx_int_to_f64"(i64 %t257)
  %t259 = call i64 @f64_parse(ptr @.str.exp_predictive_s.26)
  %t260 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t259)
  store i64 %t260, ptr %local.b_try.248
  %t261 = load i64, ptr %local.r
  %t262 = load i64, ptr %local.a
  %t263 = load i64, ptr %local.b_try.248
  %t264 = call i64 @f64_parse(ptr @.str.exp_predictive_s.27)
  %t265 = call i64 @f64_parse(ptr @.str.exp_predictive_s.28)
  %t266 = call i64 @"predict_s_rmse"(i64 %t261, i64 %t262, i64 %t263, i64 %t264, i64 %t265, i64 0)
  store i64 %t266, ptr %local.rmse.249
  %t267 = load i64, ptr %local.rmse.249
  %t268 = load i64, ptr %local.best_rmse.246
  %t269 = call i64 @"sx_f64_lt"(i64 %t267, i64 %t268)
  %t270 = icmp ne i64 %t269, 0
  br i1 %t270, label %then15, label %else15
then15:
  %t271 = load i64, ptr %local.rmse.249
  store i64 %t271, ptr %local.best_rmse.246
  %t272 = load i64, ptr %local.b_try.248
  store i64 %t272, ptr %local.best_b.245
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t273 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t274 = load i64, ptr %local.bi.247
  %t275 = add i64 %t274, 1
  store i64 %t275, ptr %local.bi.247
  br label %loop14
endloop14:
  %t276 = load i64, ptr %local.best_b.245
  ret i64 %t276
}

define i64 @"learn_coeff_cd"(i64 %r, i64 %a, i64 %b) nounwind {
entry:
  %local.best_c.277 = alloca i64
  %local.best_d.278 = alloca i64
  %local.best_rmse.279 = alloca i64
  %local.ci.280 = alloca i64
  %local.di.281 = alloca i64
  %local.c_try.282 = alloca i64
  %local.d_try.283 = alloca i64
  %local.rmse.284 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t285 = call i64 @f64_parse(ptr @.str.exp_predictive_s.29)
  store i64 %t285, ptr %local.best_c.277
  %t286 = call i64 @f64_parse(ptr @.str.exp_predictive_s.30)
  store i64 %t286, ptr %local.best_d.278
  %t287 = call i64 @f64_parse(ptr @.str.exp_predictive_s.31)
  store i64 %t287, ptr %local.best_rmse.279
  %t288 = sub i64 0, 4
  store i64 %t288, ptr %local.ci.280
  store i64 0, ptr %local.di.281
  br label %loop16
loop16:
  %t289 = load i64, ptr %local.ci.280
  %t290 = icmp sle i64 %t289, 4
  %t291 = zext i1 %t290 to i64
  %t292 = icmp ne i64 %t291, 0
  br i1 %t292, label %body16, label %endloop16
body16:
  %t293 = load i64, ptr %local.ci.280
  %t294 = call i64 @"sx_int_to_f64"(i64 %t293)
  %t295 = call i64 @f64_parse(ptr @.str.exp_predictive_s.32)
  %t296 = call i64 @"sx_f64_mul"(i64 %t294, i64 %t295)
  store i64 %t296, ptr %local.c_try.282
  %t297 = sub i64 0, 4
  store i64 %t297, ptr %local.di.281
  br label %loop17
loop17:
  %t298 = load i64, ptr %local.di.281
  %t299 = icmp sle i64 %t298, 4
  %t300 = zext i1 %t299 to i64
  %t301 = icmp ne i64 %t300, 0
  br i1 %t301, label %body17, label %endloop17
body17:
  %t302 = load i64, ptr %local.di.281
  %t303 = call i64 @"sx_int_to_f64"(i64 %t302)
  %t304 = call i64 @f64_parse(ptr @.str.exp_predictive_s.33)
  %t305 = call i64 @"sx_f64_mul"(i64 %t303, i64 %t304)
  store i64 %t305, ptr %local.d_try.283
  %t306 = load i64, ptr %local.r
  %t307 = load i64, ptr %local.a
  %t308 = load i64, ptr %local.b
  %t309 = load i64, ptr %local.c_try.282
  %t310 = load i64, ptr %local.d_try.283
  %t311 = call i64 @"predict_s_rmse"(i64 %t306, i64 %t307, i64 %t308, i64 %t309, i64 %t310, i64 0)
  store i64 %t311, ptr %local.rmse.284
  %t312 = load i64, ptr %local.rmse.284
  %t313 = load i64, ptr %local.best_rmse.279
  %t314 = call i64 @"sx_f64_lt"(i64 %t312, i64 %t313)
  %t315 = icmp ne i64 %t314, 0
  br i1 %t315, label %then18, label %else18
then18:
  %t316 = load i64, ptr %local.rmse.284
  store i64 %t316, ptr %local.best_rmse.279
  %t317 = load i64, ptr %local.c_try.282
  store i64 %t317, ptr %local.best_c.277
  %t318 = load i64, ptr %local.d_try.283
  store i64 %t318, ptr %local.best_d.278
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t319 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t320 = load i64, ptr %local.di.281
  %t321 = add i64 %t320, 1
  store i64 %t321, ptr %local.di.281
  br label %loop17
endloop17:
  %t322 = load i64, ptr %local.ci.280
  %t323 = add i64 %t322, 1
  store i64 %t323, ptr %local.ci.280
  br label %loop16
endloop16:
  %t324 = load i64, ptr %local.best_c.277
  %t325 = call i64 @f64_parse(ptr @.str.exp_predictive_s.34)
  %t326 = call i64 @"sx_f64_mul"(i64 %t324, i64 %t325)
  %t327 = load i64, ptr %local.best_d.278
  %t328 = call i64 @"sx_f64_add"(i64 %t326, i64 %t327)
  ret i64 %t328
}

define i64 @"run_exp1_for_r"(i64 %r) nounwind {
entry:
  %local.a.329 = alloca i64
  %local.b.330 = alloca i64
  %local.cd_packed.331 = alloca i64
  %local.c_approx.332 = alloca i64
  %local.ci.333 = alloca i64
  %local.best_diff.334 = alloca i64
  %local.best_c.335 = alloca i64
  %local.c_try.336 = alloca i64
  %local.diff.337 = alloca i64
  %local.c.338 = alloca i64
  %local.d.339 = alloca i64
  %local.train_rmse.340 = alloca i64
  %local.test_rmse.341 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t342 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.35)
  %t343 = ptrtoint ptr %t342 to i64
  %t344 = inttoptr i64 %t343 to ptr
  call void @intrinsic_print(ptr %t344)
  %t345 = load i64, ptr %local.r
  %t346 = call i64 @"print_f64"(i64 %t345)
  %t347 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.36)
  %t348 = ptrtoint ptr %t347 to i64
  %t349 = inttoptr i64 %t348 to ptr
  call void @intrinsic_println(ptr %t349)
  %t350 = load i64, ptr %local.r
  %t351 = call i64 @"learn_coeff_a"(i64 %t350)
  store i64 %t351, ptr %local.a.329
  %t352 = load i64, ptr %local.r
  %t353 = load i64, ptr %local.a.329
  %t354 = call i64 @"learn_coeff_b"(i64 %t352, i64 %t353)
  store i64 %t354, ptr %local.b.330
  %t355 = load i64, ptr %local.r
  %t356 = load i64, ptr %local.a.329
  %t357 = load i64, ptr %local.b.330
  %t358 = call i64 @"learn_coeff_cd"(i64 %t355, i64 %t356, i64 %t357)
  store i64 %t358, ptr %local.cd_packed.331
  %t359 = call i64 @f64_parse(ptr @.str.exp_predictive_s.37)
  store i64 %t359, ptr %local.c_approx.332
  %t360 = sub i64 0, 4
  store i64 %t360, ptr %local.ci.333
  %t361 = call i64 @f64_parse(ptr @.str.exp_predictive_s.38)
  store i64 %t361, ptr %local.best_diff.334
  %t362 = call i64 @f64_parse(ptr @.str.exp_predictive_s.39)
  store i64 %t362, ptr %local.best_c.335
  br label %loop19
loop19:
  %t363 = load i64, ptr %local.ci.333
  %t364 = icmp sle i64 %t363, 4
  %t365 = zext i1 %t364 to i64
  %t366 = icmp ne i64 %t365, 0
  br i1 %t366, label %body19, label %endloop19
body19:
  %t367 = load i64, ptr %local.ci.333
  %t368 = call i64 @"sx_int_to_f64"(i64 %t367)
  %t369 = call i64 @f64_parse(ptr @.str.exp_predictive_s.40)
  %t370 = call i64 @"sx_f64_mul"(i64 %t368, i64 %t369)
  store i64 %t370, ptr %local.c_try.336
  %t371 = load i64, ptr %local.cd_packed.331
  %t372 = load i64, ptr %local.c_try.336
  %t373 = call i64 @f64_parse(ptr @.str.exp_predictive_s.41)
  %t374 = call i64 @"sx_f64_mul"(i64 %t372, i64 %t373)
  %t375 = call i64 @"sx_f64_sub"(i64 %t371, i64 %t374)
  %t376 = call i64 @"abs_f64"(i64 %t375)
  store i64 %t376, ptr %local.diff.337
  %t377 = load i64, ptr %local.diff.337
  %t378 = load i64, ptr %local.best_diff.334
  %t379 = call i64 @"sx_f64_lt"(i64 %t377, i64 %t378)
  %t380 = icmp ne i64 %t379, 0
  br i1 %t380, label %then20, label %else20
then20:
  %t381 = load i64, ptr %local.diff.337
  store i64 %t381, ptr %local.best_diff.334
  %t382 = load i64, ptr %local.c_try.336
  store i64 %t382, ptr %local.best_c.335
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t383 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t384 = load i64, ptr %local.ci.333
  %t385 = add i64 %t384, 1
  store i64 %t385, ptr %local.ci.333
  br label %loop19
endloop19:
  %t386 = load i64, ptr %local.best_c.335
  store i64 %t386, ptr %local.c.338
  %t387 = load i64, ptr %local.cd_packed.331
  %t388 = load i64, ptr %local.c.338
  %t389 = call i64 @f64_parse(ptr @.str.exp_predictive_s.42)
  %t390 = call i64 @"sx_f64_mul"(i64 %t388, i64 %t389)
  %t391 = call i64 @"sx_f64_sub"(i64 %t387, i64 %t390)
  store i64 %t391, ptr %local.d.339
  %t392 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.43)
  %t393 = ptrtoint ptr %t392 to i64
  %t394 = inttoptr i64 %t393 to ptr
  call void @intrinsic_print(ptr %t394)
  %t395 = load i64, ptr %local.a.329
  %t396 = call i64 @"print_f64"(i64 %t395)
  %t397 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.44)
  %t398 = ptrtoint ptr %t397 to i64
  %t399 = inttoptr i64 %t398 to ptr
  call void @intrinsic_print(ptr %t399)
  %t400 = load i64, ptr %local.b.330
  %t401 = call i64 @"print_f64"(i64 %t400)
  %t402 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.45)
  %t403 = ptrtoint ptr %t402 to i64
  %t404 = inttoptr i64 %t403 to ptr
  call void @intrinsic_print(ptr %t404)
  %t405 = load i64, ptr %local.c.338
  %t406 = call i64 @"print_f64"(i64 %t405)
  %t407 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.46)
  %t408 = ptrtoint ptr %t407 to i64
  %t409 = inttoptr i64 %t408 to ptr
  call void @intrinsic_print(ptr %t409)
  %t410 = load i64, ptr %local.d.339
  %t411 = call i64 @"print_f64"(i64 %t410)
  %t412 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.47)
  %t413 = ptrtoint ptr %t412 to i64
  %t414 = inttoptr i64 %t413 to ptr
  call void @intrinsic_println(ptr %t414)
  %t415 = load i64, ptr %local.r
  %t416 = load i64, ptr %local.a.329
  %t417 = load i64, ptr %local.b.330
  %t418 = load i64, ptr %local.c.338
  %t419 = load i64, ptr %local.d.339
  %t420 = call i64 @"predict_s_rmse"(i64 %t415, i64 %t416, i64 %t417, i64 %t418, i64 %t419, i64 0)
  store i64 %t420, ptr %local.train_rmse.340
  %t421 = load i64, ptr %local.r
  %t422 = load i64, ptr %local.a.329
  %t423 = load i64, ptr %local.b.330
  %t424 = load i64, ptr %local.c.338
  %t425 = load i64, ptr %local.d.339
  %t426 = call i64 @"predict_s_rmse"(i64 %t421, i64 %t422, i64 %t423, i64 %t424, i64 %t425, i64 1)
  store i64 %t426, ptr %local.test_rmse.341
  %t427 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.48)
  %t428 = ptrtoint ptr %t427 to i64
  %t429 = inttoptr i64 %t428 to ptr
  call void @intrinsic_print(ptr %t429)
  %t430 = load i64, ptr %local.train_rmse.340
  %t431 = call i64 @"print_f64"(i64 %t430)
  %t432 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.49)
  %t433 = ptrtoint ptr %t432 to i64
  %t434 = inttoptr i64 %t433 to ptr
  call void @intrinsic_println(ptr %t434)
  %t435 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.50)
  %t436 = ptrtoint ptr %t435 to i64
  %t437 = inttoptr i64 %t436 to ptr
  call void @intrinsic_print(ptr %t437)
  %t438 = load i64, ptr %local.test_rmse.341
  %t439 = call i64 @"print_f64"(i64 %t438)
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.51)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_println(ptr %t442)
  %t443 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.52)
  %t444 = ptrtoint ptr %t443 to i64
  %t445 = inttoptr i64 %t444 to ptr
  call void @intrinsic_print(ptr %t445)
  %t446 = load i64, ptr %local.r
  %t447 = call i64 @"s_series_val"(i64 %t446, i64 0)
  %t448 = call i64 @"print_f64"(i64 %t447)
  %t449 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.53)
  %t450 = ptrtoint ptr %t449 to i64
  %t451 = inttoptr i64 %t450 to ptr
  call void @intrinsic_print(ptr %t451)
  %t452 = load i64, ptr %local.r
  %t453 = call i64 @"s_series_val"(i64 %t452, i64 50)
  %t454 = call i64 @"print_f64"(i64 %t453)
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.54)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_print(ptr %t457)
  %t458 = load i64, ptr %local.r
  %t459 = call i64 @"s_series_val"(i64 %t458, i64 150)
  %t460 = call i64 @"print_f64"(i64 %t459)
  %t461 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.55)
  %t462 = ptrtoint ptr %t461 to i64
  %t463 = inttoptr i64 %t462 to ptr
  call void @intrinsic_println(ptr %t463)
  %t464 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.56)
  %t465 = ptrtoint ptr %t464 to i64
  %t466 = inttoptr i64 %t465 to ptr
  call void @intrinsic_println(ptr %t466)
  ret i64 0
}

define i64 @"run_exp1"() nounwind {
entry:
  %t467 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.57)
  %t468 = ptrtoint ptr %t467 to i64
  %t469 = inttoptr i64 %t468 to ptr
  call void @intrinsic_println(ptr %t469)
  %t470 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.58)
  %t471 = ptrtoint ptr %t470 to i64
  %t472 = inttoptr i64 %t471 to ptr
  call void @intrinsic_println(ptr %t472)
  %t473 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.59)
  %t474 = ptrtoint ptr %t473 to i64
  %t475 = inttoptr i64 %t474 to ptr
  call void @intrinsic_println(ptr %t475)
  %t476 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.60)
  %t477 = ptrtoint ptr %t476 to i64
  %t478 = inttoptr i64 %t477 to ptr
  call void @intrinsic_println(ptr %t478)
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.61)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_println(ptr %t481)
  %t482 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.62)
  %t483 = ptrtoint ptr %t482 to i64
  %t484 = inttoptr i64 %t483 to ptr
  call void @intrinsic_println(ptr %t484)
  %t485 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.63)
  %t486 = ptrtoint ptr %t485 to i64
  %t487 = inttoptr i64 %t486 to ptr
  call void @intrinsic_println(ptr %t487)
  %t488 = call i64 @f64_parse(ptr @.str.exp_predictive_s.64)
  %t489 = call i64 @"run_exp1_for_r"(i64 %t488)
  %t490 = call i64 @f64_parse(ptr @.str.exp_predictive_s.65)
  %t491 = call i64 @"run_exp1_for_r"(i64 %t490)
  %t492 = call i64 @f64_parse(ptr @.str.exp_predictive_s.66)
  %t493 = call i64 @"run_exp1_for_r"(i64 %t492)
  %t494 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.67)
  %t495 = ptrtoint ptr %t494 to i64
  %t496 = inttoptr i64 %t495 to ptr
  call void @intrinsic_println(ptr %t496)
  %t497 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.68)
  %t498 = ptrtoint ptr %t497 to i64
  %t499 = inttoptr i64 %t498 to ptr
  call void @intrinsic_println(ptr %t499)
  %t500 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.69)
  %t501 = ptrtoint ptr %t500 to i64
  %t502 = inttoptr i64 %t501 to ptr
  call void @intrinsic_println(ptr %t502)
  %t503 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.70)
  %t504 = ptrtoint ptr %t503 to i64
  %t505 = inttoptr i64 %t504 to ptr
  call void @intrinsic_println(ptr %t505)
  %t506 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.71)
  %t507 = ptrtoint ptr %t506 to i64
  %t508 = inttoptr i64 %t507 to ptr
  call void @intrinsic_println(ptr %t508)
  %t509 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.72)
  %t510 = ptrtoint ptr %t509 to i64
  %t511 = inttoptr i64 %t510 to ptr
  call void @intrinsic_println(ptr %t511)
  ret i64 0
}

define i64 @"burgers_step"(i64 %ul, i64 %uc, i64 %ur, i64 %nu, i64 %dt, i64 %dx) nounwind {
entry:
  %local.dudx.512 = alloca i64
  %local.d2udx2.513 = alloca i64
  %local.ul = alloca i64
  store i64 %ul, ptr %local.ul
  %local.uc = alloca i64
  store i64 %uc, ptr %local.uc
  %local.ur = alloca i64
  store i64 %ur, ptr %local.ur
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t514 = load i64, ptr %local.ur
  %t515 = load i64, ptr %local.ul
  %t516 = call i64 @"sx_f64_sub"(i64 %t514, i64 %t515)
  %t517 = call i64 @f64_parse(ptr @.str.exp_predictive_s.73)
  %t518 = load i64, ptr %local.dx
  %t519 = call i64 @"sx_f64_mul"(i64 %t517, i64 %t518)
  %t520 = call i64 @"sx_f64_div"(i64 %t516, i64 %t519)
  store i64 %t520, ptr %local.dudx.512
  %t521 = load i64, ptr %local.ur
  %t522 = call i64 @f64_parse(ptr @.str.exp_predictive_s.74)
  %t523 = load i64, ptr %local.uc
  %t524 = call i64 @"sx_f64_mul"(i64 %t522, i64 %t523)
  %t525 = call i64 @"sx_f64_sub"(i64 %t521, i64 %t524)
  %t526 = load i64, ptr %local.ul
  %t527 = call i64 @"sx_f64_add"(i64 %t525, i64 %t526)
  %t528 = load i64, ptr %local.dx
  %t529 = load i64, ptr %local.dx
  %t530 = call i64 @"sx_f64_mul"(i64 %t528, i64 %t529)
  %t531 = call i64 @"sx_f64_div"(i64 %t527, i64 %t530)
  store i64 %t531, ptr %local.d2udx2.513
  %t532 = load i64, ptr %local.uc
  %t533 = load i64, ptr %local.dt
  %t534 = call i64 @f64_parse(ptr @.str.exp_predictive_s.75)
  %t535 = load i64, ptr %local.uc
  %t536 = load i64, ptr %local.dudx.512
  %t537 = call i64 @"sx_f64_mul"(i64 %t535, i64 %t536)
  %t538 = call i64 @"sx_f64_sub"(i64 %t534, i64 %t537)
  %t539 = load i64, ptr %local.nu
  %t540 = load i64, ptr %local.d2udx2.513
  %t541 = call i64 @"sx_f64_mul"(i64 %t539, i64 %t540)
  %t542 = call i64 @"sx_f64_add"(i64 %t538, i64 %t541)
  %t543 = call i64 @"sx_f64_mul"(i64 %t533, i64 %t542)
  %t544 = call i64 @"sx_f64_add"(i64 %t532, i64 %t543)
  %t545 = call i64 @"clamp_f64"(i64 %t544)
  ret i64 %t545
}

define i64 @"pi_val"() nounwind {
entry:
  %t546 = call i64 @f64_parse(ptr @.str.exp_predictive_s.76)
  ret i64 %t546
}

define i64 @"burgers_detect"(i64 %nu, i64 %query) nounwind {
entry:
  %local.dx.547 = alloca i64
  %local.dt.548 = alloca i64
  %local.pi.549 = alloca i64
  %local.u0.550 = alloca i64
  %local.u1.551 = alloca i64
  %local.u2.552 = alloca i64
  %local.u3.553 = alloca i64
  %local.u4.554 = alloca i64
  %local.u5.555 = alloca i64
  %local.u6.556 = alloca i64
  %local.u7.557 = alloca i64
  %local.u8.558 = alloca i64
  %local.u9.559 = alloca i64
  %local.step.560 = alloca i64
  %local.detected.561 = alloca i64
  %local.prev_metric.562 = alloca i64
  %local.curr_metric.563 = alloca i64
  %local.win_sum.564 = alloca i64
  %local.win_count.565 = alloca i64
  %local.prev_avg.566 = alloca i64
  %local.n0.567 = alloca i64
  %local.n1.568 = alloca i64
  %local.n2.569 = alloca i64
  %local.n3.570 = alloca i64
  %local.n4.571 = alloca i64
  %local.n5.572 = alloca i64
  %local.n6.573 = alloca i64
  %local.n7.574 = alloca i64
  %local.n8.575 = alloca i64
  %local.n9.576 = alloca i64
  %local.avg.577 = alloca i64
  %local.s_val.578 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t579 = call i64 @f64_parse(ptr @.str.exp_predictive_s.77)
  store i64 %t579, ptr %local.dx.547
  %t580 = call i64 @f64_parse(ptr @.str.exp_predictive_s.78)
  store i64 %t580, ptr %local.dt.548
  %t581 = call i64 @"pi_val"()
  store i64 %t581, ptr %local.pi.549
  %t582 = call i64 @f64_parse(ptr @.str.exp_predictive_s.79)
  %t583 = load i64, ptr %local.pi.549
  %t584 = call i64 @"sx_f64_mul"(i64 %t582, i64 %t583)
  %t585 = call i64 @f64_parse(ptr @.str.exp_predictive_s.80)
  %t586 = call i64 @"sx_f64_mul"(i64 %t584, i64 %t585)
  %t587 = call i64 @"sin_f64"(i64 %t586)
  store i64 %t587, ptr %local.u0.550
  %t588 = call i64 @f64_parse(ptr @.str.exp_predictive_s.81)
  %t589 = load i64, ptr %local.pi.549
  %t590 = call i64 @"sx_f64_mul"(i64 %t588, i64 %t589)
  %t591 = call i64 @f64_parse(ptr @.str.exp_predictive_s.82)
  %t592 = call i64 @"sx_f64_mul"(i64 %t590, i64 %t591)
  %t593 = call i64 @"sin_f64"(i64 %t592)
  store i64 %t593, ptr %local.u1.551
  %t594 = call i64 @f64_parse(ptr @.str.exp_predictive_s.83)
  %t595 = load i64, ptr %local.pi.549
  %t596 = call i64 @"sx_f64_mul"(i64 %t594, i64 %t595)
  %t597 = call i64 @f64_parse(ptr @.str.exp_predictive_s.84)
  %t598 = call i64 @"sx_f64_mul"(i64 %t596, i64 %t597)
  %t599 = call i64 @"sin_f64"(i64 %t598)
  store i64 %t599, ptr %local.u2.552
  %t600 = call i64 @f64_parse(ptr @.str.exp_predictive_s.85)
  %t601 = load i64, ptr %local.pi.549
  %t602 = call i64 @"sx_f64_mul"(i64 %t600, i64 %t601)
  %t603 = call i64 @f64_parse(ptr @.str.exp_predictive_s.86)
  %t604 = call i64 @"sx_f64_mul"(i64 %t602, i64 %t603)
  %t605 = call i64 @"sin_f64"(i64 %t604)
  store i64 %t605, ptr %local.u3.553
  %t606 = call i64 @f64_parse(ptr @.str.exp_predictive_s.87)
  %t607 = load i64, ptr %local.pi.549
  %t608 = call i64 @"sx_f64_mul"(i64 %t606, i64 %t607)
  %t609 = call i64 @f64_parse(ptr @.str.exp_predictive_s.88)
  %t610 = call i64 @"sx_f64_mul"(i64 %t608, i64 %t609)
  %t611 = call i64 @"sin_f64"(i64 %t610)
  store i64 %t611, ptr %local.u4.554
  %t612 = call i64 @f64_parse(ptr @.str.exp_predictive_s.89)
  %t613 = load i64, ptr %local.pi.549
  %t614 = call i64 @"sx_f64_mul"(i64 %t612, i64 %t613)
  %t615 = call i64 @f64_parse(ptr @.str.exp_predictive_s.90)
  %t616 = call i64 @"sx_f64_mul"(i64 %t614, i64 %t615)
  %t617 = call i64 @"sin_f64"(i64 %t616)
  store i64 %t617, ptr %local.u5.555
  %t618 = call i64 @f64_parse(ptr @.str.exp_predictive_s.91)
  %t619 = load i64, ptr %local.pi.549
  %t620 = call i64 @"sx_f64_mul"(i64 %t618, i64 %t619)
  %t621 = call i64 @f64_parse(ptr @.str.exp_predictive_s.92)
  %t622 = call i64 @"sx_f64_mul"(i64 %t620, i64 %t621)
  %t623 = call i64 @"sin_f64"(i64 %t622)
  store i64 %t623, ptr %local.u6.556
  %t624 = call i64 @f64_parse(ptr @.str.exp_predictive_s.93)
  %t625 = load i64, ptr %local.pi.549
  %t626 = call i64 @"sx_f64_mul"(i64 %t624, i64 %t625)
  %t627 = call i64 @f64_parse(ptr @.str.exp_predictive_s.94)
  %t628 = call i64 @"sx_f64_mul"(i64 %t626, i64 %t627)
  %t629 = call i64 @"sin_f64"(i64 %t628)
  store i64 %t629, ptr %local.u7.557
  %t630 = call i64 @f64_parse(ptr @.str.exp_predictive_s.95)
  %t631 = load i64, ptr %local.pi.549
  %t632 = call i64 @"sx_f64_mul"(i64 %t630, i64 %t631)
  %t633 = call i64 @f64_parse(ptr @.str.exp_predictive_s.96)
  %t634 = call i64 @"sx_f64_mul"(i64 %t632, i64 %t633)
  %t635 = call i64 @"sin_f64"(i64 %t634)
  store i64 %t635, ptr %local.u8.558
  %t636 = call i64 @f64_parse(ptr @.str.exp_predictive_s.97)
  %t637 = load i64, ptr %local.pi.549
  %t638 = call i64 @"sx_f64_mul"(i64 %t636, i64 %t637)
  %t639 = call i64 @f64_parse(ptr @.str.exp_predictive_s.98)
  %t640 = call i64 @"sx_f64_mul"(i64 %t638, i64 %t639)
  %t641 = call i64 @"sin_f64"(i64 %t640)
  store i64 %t641, ptr %local.u9.559
  store i64 0, ptr %local.step.560
  %t642 = sub i64 0, 1
  store i64 %t642, ptr %local.detected.561
  %t643 = call i64 @f64_parse(ptr @.str.exp_predictive_s.99)
  store i64 %t643, ptr %local.prev_metric.562
  %t644 = call i64 @f64_parse(ptr @.str.exp_predictive_s.100)
  store i64 %t644, ptr %local.curr_metric.563
  %t645 = call i64 @f64_parse(ptr @.str.exp_predictive_s.101)
  store i64 %t645, ptr %local.win_sum.564
  store i64 0, ptr %local.win_count.565
  %t646 = call i64 @f64_parse(ptr @.str.exp_predictive_s.102)
  store i64 %t646, ptr %local.prev_avg.566
  %t647 = load i64, ptr %local.query
  %t648 = icmp eq i64 %t647, 0
  %t649 = zext i1 %t648 to i64
  %t650 = icmp ne i64 %t649, 0
  br i1 %t650, label %then21, label %else21
then21:
  %t651 = load i64, ptr %local.u5.555
  %t652 = call i64 @"abs_f64"(i64 %t651)
  store i64 %t652, ptr %local.prev_metric.562
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t653 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t654 = load i64, ptr %local.query
  %t655 = icmp eq i64 %t654, 1
  %t656 = zext i1 %t655 to i64
  %t657 = icmp ne i64 %t656, 0
  br i1 %t657, label %then22, label %else22
then22:
  %t658 = load i64, ptr %local.u0.550
  %t659 = load i64, ptr %local.u1.551
  %t660 = load i64, ptr %local.u2.552
  %t661 = load i64, ptr %local.u3.553
  %t662 = load i64, ptr %local.u4.554
  %t663 = load i64, ptr %local.u5.555
  %t664 = load i64, ptr %local.u6.556
  %t665 = load i64, ptr %local.u7.557
  %t666 = load i64, ptr %local.u8.558
  %t667 = load i64, ptr %local.u9.559
  %t668 = load i64, ptr %local.dx.547
  %t669 = call i64 @"burgers_max_grad"(i64 %t658, i64 %t659, i64 %t660, i64 %t661, i64 %t662, i64 %t663, i64 %t664, i64 %t665, i64 %t666, i64 %t667, i64 %t668)
  store i64 %t669, ptr %local.prev_metric.562
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t670 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t671 = load i64, ptr %local.query
  %t672 = icmp eq i64 %t671, 2
  %t673 = zext i1 %t672 to i64
  %t674 = icmp ne i64 %t673, 0
  br i1 %t674, label %then23, label %else23
then23:
  %t675 = load i64, ptr %local.u0.550
  %t676 = load i64, ptr %local.u1.551
  %t677 = load i64, ptr %local.u2.552
  %t678 = load i64, ptr %local.u3.553
  %t679 = load i64, ptr %local.u4.554
  %t680 = load i64, ptr %local.u5.555
  %t681 = load i64, ptr %local.u6.556
  %t682 = load i64, ptr %local.u7.557
  %t683 = load i64, ptr %local.u8.558
  %t684 = load i64, ptr %local.u9.559
  %t685 = call i64 @"burgers_energy"(i64 %t675, i64 %t676, i64 %t677, i64 %t678, i64 %t679, i64 %t680, i64 %t681, i64 %t682, i64 %t683, i64 %t684)
  store i64 %t685, ptr %local.prev_metric.562
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t686 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t687 = load i64, ptr %local.prev_metric.562
  store i64 %t687, ptr %local.prev_avg.566
  br label %loop24
loop24:
  %t688 = load i64, ptr %local.step.560
  %t689 = icmp slt i64 %t688, 30000
  %t690 = zext i1 %t689 to i64
  %t691 = icmp ne i64 %t690, 0
  br i1 %t691, label %body24, label %endloop24
body24:
  %t692 = load i64, ptr %local.u9.559
  %t693 = load i64, ptr %local.u0.550
  %t694 = load i64, ptr %local.u1.551
  %t695 = load i64, ptr %local.nu
  %t696 = load i64, ptr %local.dt.548
  %t697 = load i64, ptr %local.dx.547
  %t698 = call i64 @"burgers_step"(i64 %t692, i64 %t693, i64 %t694, i64 %t695, i64 %t696, i64 %t697)
  store i64 %t698, ptr %local.n0.567
  %t699 = load i64, ptr %local.u0.550
  %t700 = load i64, ptr %local.u1.551
  %t701 = load i64, ptr %local.u2.552
  %t702 = load i64, ptr %local.nu
  %t703 = load i64, ptr %local.dt.548
  %t704 = load i64, ptr %local.dx.547
  %t705 = call i64 @"burgers_step"(i64 %t699, i64 %t700, i64 %t701, i64 %t702, i64 %t703, i64 %t704)
  store i64 %t705, ptr %local.n1.568
  %t706 = load i64, ptr %local.u1.551
  %t707 = load i64, ptr %local.u2.552
  %t708 = load i64, ptr %local.u3.553
  %t709 = load i64, ptr %local.nu
  %t710 = load i64, ptr %local.dt.548
  %t711 = load i64, ptr %local.dx.547
  %t712 = call i64 @"burgers_step"(i64 %t706, i64 %t707, i64 %t708, i64 %t709, i64 %t710, i64 %t711)
  store i64 %t712, ptr %local.n2.569
  %t713 = load i64, ptr %local.u2.552
  %t714 = load i64, ptr %local.u3.553
  %t715 = load i64, ptr %local.u4.554
  %t716 = load i64, ptr %local.nu
  %t717 = load i64, ptr %local.dt.548
  %t718 = load i64, ptr %local.dx.547
  %t719 = call i64 @"burgers_step"(i64 %t713, i64 %t714, i64 %t715, i64 %t716, i64 %t717, i64 %t718)
  store i64 %t719, ptr %local.n3.570
  %t720 = load i64, ptr %local.u3.553
  %t721 = load i64, ptr %local.u4.554
  %t722 = load i64, ptr %local.u5.555
  %t723 = load i64, ptr %local.nu
  %t724 = load i64, ptr %local.dt.548
  %t725 = load i64, ptr %local.dx.547
  %t726 = call i64 @"burgers_step"(i64 %t720, i64 %t721, i64 %t722, i64 %t723, i64 %t724, i64 %t725)
  store i64 %t726, ptr %local.n4.571
  %t727 = load i64, ptr %local.u4.554
  %t728 = load i64, ptr %local.u5.555
  %t729 = load i64, ptr %local.u6.556
  %t730 = load i64, ptr %local.nu
  %t731 = load i64, ptr %local.dt.548
  %t732 = load i64, ptr %local.dx.547
  %t733 = call i64 @"burgers_step"(i64 %t727, i64 %t728, i64 %t729, i64 %t730, i64 %t731, i64 %t732)
  store i64 %t733, ptr %local.n5.572
  %t734 = load i64, ptr %local.u5.555
  %t735 = load i64, ptr %local.u6.556
  %t736 = load i64, ptr %local.u7.557
  %t737 = load i64, ptr %local.nu
  %t738 = load i64, ptr %local.dt.548
  %t739 = load i64, ptr %local.dx.547
  %t740 = call i64 @"burgers_step"(i64 %t734, i64 %t735, i64 %t736, i64 %t737, i64 %t738, i64 %t739)
  store i64 %t740, ptr %local.n6.573
  %t741 = load i64, ptr %local.u6.556
  %t742 = load i64, ptr %local.u7.557
  %t743 = load i64, ptr %local.u8.558
  %t744 = load i64, ptr %local.nu
  %t745 = load i64, ptr %local.dt.548
  %t746 = load i64, ptr %local.dx.547
  %t747 = call i64 @"burgers_step"(i64 %t741, i64 %t742, i64 %t743, i64 %t744, i64 %t745, i64 %t746)
  store i64 %t747, ptr %local.n7.574
  %t748 = load i64, ptr %local.u7.557
  %t749 = load i64, ptr %local.u8.558
  %t750 = load i64, ptr %local.u9.559
  %t751 = load i64, ptr %local.nu
  %t752 = load i64, ptr %local.dt.548
  %t753 = load i64, ptr %local.dx.547
  %t754 = call i64 @"burgers_step"(i64 %t748, i64 %t749, i64 %t750, i64 %t751, i64 %t752, i64 %t753)
  store i64 %t754, ptr %local.n8.575
  %t755 = load i64, ptr %local.u8.558
  %t756 = load i64, ptr %local.u9.559
  %t757 = load i64, ptr %local.u0.550
  %t758 = load i64, ptr %local.nu
  %t759 = load i64, ptr %local.dt.548
  %t760 = load i64, ptr %local.dx.547
  %t761 = call i64 @"burgers_step"(i64 %t755, i64 %t756, i64 %t757, i64 %t758, i64 %t759, i64 %t760)
  store i64 %t761, ptr %local.n9.576
  %t762 = load i64, ptr %local.n0.567
  store i64 %t762, ptr %local.u0.550
  %t763 = load i64, ptr %local.n1.568
  store i64 %t763, ptr %local.u1.551
  %t764 = load i64, ptr %local.n2.569
  store i64 %t764, ptr %local.u2.552
  %t765 = load i64, ptr %local.n3.570
  store i64 %t765, ptr %local.u3.553
  %t766 = load i64, ptr %local.n4.571
  store i64 %t766, ptr %local.u4.554
  %t767 = load i64, ptr %local.n5.572
  store i64 %t767, ptr %local.u5.555
  %t768 = load i64, ptr %local.n6.573
  store i64 %t768, ptr %local.u6.556
  %t769 = load i64, ptr %local.n7.574
  store i64 %t769, ptr %local.u7.557
  %t770 = load i64, ptr %local.n8.575
  store i64 %t770, ptr %local.u8.558
  %t771 = load i64, ptr %local.n9.576
  store i64 %t771, ptr %local.u9.559
  %t772 = load i64, ptr %local.step.560
  %t773 = srem i64 %t772, 100
  %t774 = icmp eq i64 %t773, 0
  %t775 = zext i1 %t774 to i64
  %t776 = icmp ne i64 %t775, 0
  br i1 %t776, label %then25, label %else25
then25:
  %t777 = load i64, ptr %local.query
  %t778 = icmp eq i64 %t777, 0
  %t779 = zext i1 %t778 to i64
  %t780 = icmp ne i64 %t779, 0
  br i1 %t780, label %then26, label %else26
then26:
  %t781 = load i64, ptr %local.u5.555
  %t782 = call i64 @"abs_f64"(i64 %t781)
  store i64 %t782, ptr %local.curr_metric.563
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t783 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t784 = load i64, ptr %local.query
  %t785 = icmp eq i64 %t784, 1
  %t786 = zext i1 %t785 to i64
  %t787 = icmp ne i64 %t786, 0
  br i1 %t787, label %then27, label %else27
then27:
  %t788 = load i64, ptr %local.u0.550
  %t789 = load i64, ptr %local.u1.551
  %t790 = load i64, ptr %local.u2.552
  %t791 = load i64, ptr %local.u3.553
  %t792 = load i64, ptr %local.u4.554
  %t793 = load i64, ptr %local.u5.555
  %t794 = load i64, ptr %local.u6.556
  %t795 = load i64, ptr %local.u7.557
  %t796 = load i64, ptr %local.u8.558
  %t797 = load i64, ptr %local.u9.559
  %t798 = load i64, ptr %local.dx.547
  %t799 = call i64 @"burgers_max_grad"(i64 %t788, i64 %t789, i64 %t790, i64 %t791, i64 %t792, i64 %t793, i64 %t794, i64 %t795, i64 %t796, i64 %t797, i64 %t798)
  store i64 %t799, ptr %local.curr_metric.563
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t800 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t801 = load i64, ptr %local.query
  %t802 = icmp eq i64 %t801, 2
  %t803 = zext i1 %t802 to i64
  %t804 = icmp ne i64 %t803, 0
  br i1 %t804, label %then28, label %else28
then28:
  %t805 = load i64, ptr %local.u0.550
  %t806 = load i64, ptr %local.u1.551
  %t807 = load i64, ptr %local.u2.552
  %t808 = load i64, ptr %local.u3.553
  %t809 = load i64, ptr %local.u4.554
  %t810 = load i64, ptr %local.u5.555
  %t811 = load i64, ptr %local.u6.556
  %t812 = load i64, ptr %local.u7.557
  %t813 = load i64, ptr %local.u8.558
  %t814 = load i64, ptr %local.u9.559
  %t815 = call i64 @"burgers_energy"(i64 %t805, i64 %t806, i64 %t807, i64 %t808, i64 %t809, i64 %t810, i64 %t811, i64 %t812, i64 %t813, i64 %t814)
  store i64 %t815, ptr %local.curr_metric.563
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t816 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t817 = load i64, ptr %local.win_sum.564
  %t818 = load i64, ptr %local.curr_metric.563
  %t819 = call i64 @"sx_f64_add"(i64 %t817, i64 %t818)
  store i64 %t819, ptr %local.win_sum.564
  %t820 = load i64, ptr %local.win_count.565
  %t821 = add i64 %t820, 1
  store i64 %t821, ptr %local.win_count.565
  %t822 = load i64, ptr %local.win_count.565
  %t823 = icmp sge i64 %t822, 10
  %t824 = zext i1 %t823 to i64
  %t825 = icmp ne i64 %t824, 0
  br i1 %t825, label %then29, label %else29
then29:
  %t826 = load i64, ptr %local.win_sum.564
  %t827 = call i64 @f64_parse(ptr @.str.exp_predictive_s.103)
  %t828 = call i64 @"sx_f64_div"(i64 %t826, i64 %t827)
  store i64 %t828, ptr %local.avg.577
  %t829 = load i64, ptr %local.prev_avg.566
  %t830 = call i64 @f64_parse(ptr @.str.exp_predictive_s.104)
  %t831 = call i64 @"sx_f64_gt"(i64 %t829, i64 %t830)
  %t832 = icmp ne i64 %t831, 0
  br i1 %t832, label %then30, label %else30
then30:
  %t833 = call i64 @f64_parse(ptr @.str.exp_predictive_s.105)
  %t834 = load i64, ptr %local.avg.577
  %t835 = load i64, ptr %local.prev_avg.566
  %t836 = call i64 @"sx_f64_div"(i64 %t834, i64 %t835)
  %t837 = call i64 @"sx_f64_sub"(i64 %t833, i64 %t836)
  store i64 %t837, ptr %local.s_val.578
  %t838 = load i64, ptr %local.s_val.578
  %t839 = call i64 @f64_parse(ptr @.str.exp_predictive_s.106)
  %t840 = call i64 @"sx_f64_lt"(i64 %t838, i64 %t839)
  %t841 = icmp ne i64 %t840, 0
  br i1 %t841, label %then31, label %else31
then31:
  %t842 = load i64, ptr %local.detected.561
  %t843 = sub i64 0, 1
  %t844 = icmp eq i64 %t842, %t843
  %t845 = zext i1 %t844 to i64
  %t846 = icmp ne i64 %t845, 0
  br i1 %t846, label %then32, label %else32
then32:
  %t847 = load i64, ptr %local.step.560
  store i64 %t847, ptr %local.detected.561
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t848 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t849 = phi i64 [ %t848, %then31_end ], [ 0, %else31_end ]
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t850 = phi i64 [ %t849, %then30_end ], [ 0, %else30_end ]
  %t851 = load i64, ptr %local.avg.577
  store i64 %t851, ptr %local.prev_avg.566
  %t852 = call i64 @f64_parse(ptr @.str.exp_predictive_s.107)
  store i64 %t852, ptr %local.win_sum.564
  store i64 0, ptr %local.win_count.565
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t853 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t854 = phi i64 [ %t853, %then25_end ], [ 0, %else25_end ]
  %t855 = load i64, ptr %local.step.560
  %t856 = add i64 %t855, 1
  store i64 %t856, ptr %local.step.560
  br label %loop24
endloop24:
  %t857 = load i64, ptr %local.detected.561
  ret i64 %t857
}

define i64 @"burgers_max_grad"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %u5, i64 %u6, i64 %u7, i64 %u8, i64 %u9, i64 %dx) nounwind {
entry:
  %local.mg.858 = alloca i64
  %local.g0.859 = alloca i64
  %local.g1.860 = alloca i64
  %local.g2.861 = alloca i64
  %local.g3.862 = alloca i64
  %local.g4.863 = alloca i64
  %local.g5.864 = alloca i64
  %local.g6.865 = alloca i64
  %local.g7.866 = alloca i64
  %local.g8.867 = alloca i64
  %local.g9.868 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.u5 = alloca i64
  store i64 %u5, ptr %local.u5
  %local.u6 = alloca i64
  store i64 %u6, ptr %local.u6
  %local.u7 = alloca i64
  store i64 %u7, ptr %local.u7
  %local.u8 = alloca i64
  store i64 %u8, ptr %local.u8
  %local.u9 = alloca i64
  store i64 %u9, ptr %local.u9
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t869 = call i64 @f64_parse(ptr @.str.exp_predictive_s.108)
  store i64 %t869, ptr %local.mg.858
  %t870 = load i64, ptr %local.u1
  %t871 = load i64, ptr %local.u9
  %t872 = call i64 @"sx_f64_sub"(i64 %t870, i64 %t871)
  %t873 = call i64 @f64_parse(ptr @.str.exp_predictive_s.109)
  %t874 = load i64, ptr %local.dx
  %t875 = call i64 @"sx_f64_mul"(i64 %t873, i64 %t874)
  %t876 = call i64 @"sx_f64_div"(i64 %t872, i64 %t875)
  %t877 = call i64 @"abs_f64"(i64 %t876)
  store i64 %t877, ptr %local.g0.859
  %t878 = load i64, ptr %local.u2
  %t879 = load i64, ptr %local.u0
  %t880 = call i64 @"sx_f64_sub"(i64 %t878, i64 %t879)
  %t881 = call i64 @f64_parse(ptr @.str.exp_predictive_s.110)
  %t882 = load i64, ptr %local.dx
  %t883 = call i64 @"sx_f64_mul"(i64 %t881, i64 %t882)
  %t884 = call i64 @"sx_f64_div"(i64 %t880, i64 %t883)
  %t885 = call i64 @"abs_f64"(i64 %t884)
  store i64 %t885, ptr %local.g1.860
  %t886 = load i64, ptr %local.u3
  %t887 = load i64, ptr %local.u1
  %t888 = call i64 @"sx_f64_sub"(i64 %t886, i64 %t887)
  %t889 = call i64 @f64_parse(ptr @.str.exp_predictive_s.111)
  %t890 = load i64, ptr %local.dx
  %t891 = call i64 @"sx_f64_mul"(i64 %t889, i64 %t890)
  %t892 = call i64 @"sx_f64_div"(i64 %t888, i64 %t891)
  %t893 = call i64 @"abs_f64"(i64 %t892)
  store i64 %t893, ptr %local.g2.861
  %t894 = load i64, ptr %local.u4
  %t895 = load i64, ptr %local.u2
  %t896 = call i64 @"sx_f64_sub"(i64 %t894, i64 %t895)
  %t897 = call i64 @f64_parse(ptr @.str.exp_predictive_s.112)
  %t898 = load i64, ptr %local.dx
  %t899 = call i64 @"sx_f64_mul"(i64 %t897, i64 %t898)
  %t900 = call i64 @"sx_f64_div"(i64 %t896, i64 %t899)
  %t901 = call i64 @"abs_f64"(i64 %t900)
  store i64 %t901, ptr %local.g3.862
  %t902 = load i64, ptr %local.u5
  %t903 = load i64, ptr %local.u3
  %t904 = call i64 @"sx_f64_sub"(i64 %t902, i64 %t903)
  %t905 = call i64 @f64_parse(ptr @.str.exp_predictive_s.113)
  %t906 = load i64, ptr %local.dx
  %t907 = call i64 @"sx_f64_mul"(i64 %t905, i64 %t906)
  %t908 = call i64 @"sx_f64_div"(i64 %t904, i64 %t907)
  %t909 = call i64 @"abs_f64"(i64 %t908)
  store i64 %t909, ptr %local.g4.863
  %t910 = load i64, ptr %local.u6
  %t911 = load i64, ptr %local.u4
  %t912 = call i64 @"sx_f64_sub"(i64 %t910, i64 %t911)
  %t913 = call i64 @f64_parse(ptr @.str.exp_predictive_s.114)
  %t914 = load i64, ptr %local.dx
  %t915 = call i64 @"sx_f64_mul"(i64 %t913, i64 %t914)
  %t916 = call i64 @"sx_f64_div"(i64 %t912, i64 %t915)
  %t917 = call i64 @"abs_f64"(i64 %t916)
  store i64 %t917, ptr %local.g5.864
  %t918 = load i64, ptr %local.u7
  %t919 = load i64, ptr %local.u5
  %t920 = call i64 @"sx_f64_sub"(i64 %t918, i64 %t919)
  %t921 = call i64 @f64_parse(ptr @.str.exp_predictive_s.115)
  %t922 = load i64, ptr %local.dx
  %t923 = call i64 @"sx_f64_mul"(i64 %t921, i64 %t922)
  %t924 = call i64 @"sx_f64_div"(i64 %t920, i64 %t923)
  %t925 = call i64 @"abs_f64"(i64 %t924)
  store i64 %t925, ptr %local.g6.865
  %t926 = load i64, ptr %local.u8
  %t927 = load i64, ptr %local.u6
  %t928 = call i64 @"sx_f64_sub"(i64 %t926, i64 %t927)
  %t929 = call i64 @f64_parse(ptr @.str.exp_predictive_s.116)
  %t930 = load i64, ptr %local.dx
  %t931 = call i64 @"sx_f64_mul"(i64 %t929, i64 %t930)
  %t932 = call i64 @"sx_f64_div"(i64 %t928, i64 %t931)
  %t933 = call i64 @"abs_f64"(i64 %t932)
  store i64 %t933, ptr %local.g7.866
  %t934 = load i64, ptr %local.u9
  %t935 = load i64, ptr %local.u7
  %t936 = call i64 @"sx_f64_sub"(i64 %t934, i64 %t935)
  %t937 = call i64 @f64_parse(ptr @.str.exp_predictive_s.117)
  %t938 = load i64, ptr %local.dx
  %t939 = call i64 @"sx_f64_mul"(i64 %t937, i64 %t938)
  %t940 = call i64 @"sx_f64_div"(i64 %t936, i64 %t939)
  %t941 = call i64 @"abs_f64"(i64 %t940)
  store i64 %t941, ptr %local.g8.867
  %t942 = load i64, ptr %local.u0
  %t943 = load i64, ptr %local.u8
  %t944 = call i64 @"sx_f64_sub"(i64 %t942, i64 %t943)
  %t945 = call i64 @f64_parse(ptr @.str.exp_predictive_s.118)
  %t946 = load i64, ptr %local.dx
  %t947 = call i64 @"sx_f64_mul"(i64 %t945, i64 %t946)
  %t948 = call i64 @"sx_f64_div"(i64 %t944, i64 %t947)
  %t949 = call i64 @"abs_f64"(i64 %t948)
  store i64 %t949, ptr %local.g9.868
  %t950 = load i64, ptr %local.g0.859
  store i64 %t950, ptr %local.mg.858
  %t951 = load i64, ptr %local.g1.860
  %t952 = load i64, ptr %local.mg.858
  %t953 = call i64 @"sx_f64_gt"(i64 %t951, i64 %t952)
  %t954 = icmp ne i64 %t953, 0
  br i1 %t954, label %then33, label %else33
then33:
  %t955 = load i64, ptr %local.g1.860
  store i64 %t955, ptr %local.mg.858
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t956 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t957 = load i64, ptr %local.g2.861
  %t958 = load i64, ptr %local.mg.858
  %t959 = call i64 @"sx_f64_gt"(i64 %t957, i64 %t958)
  %t960 = icmp ne i64 %t959, 0
  br i1 %t960, label %then34, label %else34
then34:
  %t961 = load i64, ptr %local.g2.861
  store i64 %t961, ptr %local.mg.858
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t962 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t963 = load i64, ptr %local.g3.862
  %t964 = load i64, ptr %local.mg.858
  %t965 = call i64 @"sx_f64_gt"(i64 %t963, i64 %t964)
  %t966 = icmp ne i64 %t965, 0
  br i1 %t966, label %then35, label %else35
then35:
  %t967 = load i64, ptr %local.g3.862
  store i64 %t967, ptr %local.mg.858
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t968 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t969 = load i64, ptr %local.g4.863
  %t970 = load i64, ptr %local.mg.858
  %t971 = call i64 @"sx_f64_gt"(i64 %t969, i64 %t970)
  %t972 = icmp ne i64 %t971, 0
  br i1 %t972, label %then36, label %else36
then36:
  %t973 = load i64, ptr %local.g4.863
  store i64 %t973, ptr %local.mg.858
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t974 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t975 = load i64, ptr %local.g5.864
  %t976 = load i64, ptr %local.mg.858
  %t977 = call i64 @"sx_f64_gt"(i64 %t975, i64 %t976)
  %t978 = icmp ne i64 %t977, 0
  br i1 %t978, label %then37, label %else37
then37:
  %t979 = load i64, ptr %local.g5.864
  store i64 %t979, ptr %local.mg.858
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t980 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t981 = load i64, ptr %local.g6.865
  %t982 = load i64, ptr %local.mg.858
  %t983 = call i64 @"sx_f64_gt"(i64 %t981, i64 %t982)
  %t984 = icmp ne i64 %t983, 0
  br i1 %t984, label %then38, label %else38
then38:
  %t985 = load i64, ptr %local.g6.865
  store i64 %t985, ptr %local.mg.858
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t986 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t987 = load i64, ptr %local.g7.866
  %t988 = load i64, ptr %local.mg.858
  %t989 = call i64 @"sx_f64_gt"(i64 %t987, i64 %t988)
  %t990 = icmp ne i64 %t989, 0
  br i1 %t990, label %then39, label %else39
then39:
  %t991 = load i64, ptr %local.g7.866
  store i64 %t991, ptr %local.mg.858
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t992 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t993 = load i64, ptr %local.g8.867
  %t994 = load i64, ptr %local.mg.858
  %t995 = call i64 @"sx_f64_gt"(i64 %t993, i64 %t994)
  %t996 = icmp ne i64 %t995, 0
  br i1 %t996, label %then40, label %else40
then40:
  %t997 = load i64, ptr %local.g8.867
  store i64 %t997, ptr %local.mg.858
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t998 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t999 = load i64, ptr %local.g9.868
  %t1000 = load i64, ptr %local.mg.858
  %t1001 = call i64 @"sx_f64_gt"(i64 %t999, i64 %t1000)
  %t1002 = icmp ne i64 %t1001, 0
  br i1 %t1002, label %then41, label %else41
then41:
  %t1003 = load i64, ptr %local.g9.868
  store i64 %t1003, ptr %local.mg.858
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1004 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t1005 = load i64, ptr %local.mg.858
  ret i64 %t1005
}

define i64 @"burgers_energy"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %u5, i64 %u6, i64 %u7, i64 %u8, i64 %u9) nounwind {
entry:
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.u5 = alloca i64
  store i64 %u5, ptr %local.u5
  %local.u6 = alloca i64
  store i64 %u6, ptr %local.u6
  %local.u7 = alloca i64
  store i64 %u7, ptr %local.u7
  %local.u8 = alloca i64
  store i64 %u8, ptr %local.u8
  %local.u9 = alloca i64
  store i64 %u9, ptr %local.u9
  %t1006 = load i64, ptr %local.u0
  %t1007 = load i64, ptr %local.u0
  %t1008 = call i64 @"sx_f64_mul"(i64 %t1006, i64 %t1007)
  %t1009 = load i64, ptr %local.u1
  %t1010 = load i64, ptr %local.u1
  %t1011 = call i64 @"sx_f64_mul"(i64 %t1009, i64 %t1010)
  %t1012 = call i64 @"sx_f64_add"(i64 %t1008, i64 %t1011)
  %t1013 = load i64, ptr %local.u2
  %t1014 = load i64, ptr %local.u2
  %t1015 = call i64 @"sx_f64_mul"(i64 %t1013, i64 %t1014)
  %t1016 = call i64 @"sx_f64_add"(i64 %t1012, i64 %t1015)
  %t1017 = load i64, ptr %local.u3
  %t1018 = load i64, ptr %local.u3
  %t1019 = call i64 @"sx_f64_mul"(i64 %t1017, i64 %t1018)
  %t1020 = call i64 @"sx_f64_add"(i64 %t1016, i64 %t1019)
  %t1021 = load i64, ptr %local.u4
  %t1022 = load i64, ptr %local.u4
  %t1023 = call i64 @"sx_f64_mul"(i64 %t1021, i64 %t1022)
  %t1024 = call i64 @"sx_f64_add"(i64 %t1020, i64 %t1023)
  %t1025 = load i64, ptr %local.u5
  %t1026 = load i64, ptr %local.u5
  %t1027 = call i64 @"sx_f64_mul"(i64 %t1025, i64 %t1026)
  %t1028 = call i64 @"sx_f64_add"(i64 %t1024, i64 %t1027)
  %t1029 = load i64, ptr %local.u6
  %t1030 = load i64, ptr %local.u6
  %t1031 = call i64 @"sx_f64_mul"(i64 %t1029, i64 %t1030)
  %t1032 = call i64 @"sx_f64_add"(i64 %t1028, i64 %t1031)
  %t1033 = load i64, ptr %local.u7
  %t1034 = load i64, ptr %local.u7
  %t1035 = call i64 @"sx_f64_mul"(i64 %t1033, i64 %t1034)
  %t1036 = call i64 @"sx_f64_add"(i64 %t1032, i64 %t1035)
  %t1037 = load i64, ptr %local.u8
  %t1038 = load i64, ptr %local.u8
  %t1039 = call i64 @"sx_f64_mul"(i64 %t1037, i64 %t1038)
  %t1040 = call i64 @"sx_f64_add"(i64 %t1036, i64 %t1039)
  %t1041 = load i64, ptr %local.u9
  %t1042 = load i64, ptr %local.u9
  %t1043 = call i64 @"sx_f64_mul"(i64 %t1041, i64 %t1042)
  %t1044 = call i64 @"sx_f64_add"(i64 %t1040, i64 %t1043)
  %t1045 = call i64 @f64_parse(ptr @.str.exp_predictive_s.119)
  %t1046 = call i64 @"sx_f64_div"(i64 %t1044, i64 %t1045)
  ret i64 %t1046
}

define i64 @"run_exp2_for_nu"(i64 %nu) nounwind {
entry:
  %local.s_local.1047 = alloca i64
  %local.s_grad.1048 = alloca i64
  %local.s_energy.1049 = alloca i64
  %local.first.1050 = alloca i64
  %local.first_step.1051 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %t1052 = load i64, ptr %local.nu
  %t1053 = call i64 @"burgers_detect"(i64 %t1052, i64 0)
  store i64 %t1053, ptr %local.s_local.1047
  %t1054 = load i64, ptr %local.nu
  %t1055 = call i64 @"burgers_detect"(i64 %t1054, i64 1)
  store i64 %t1055, ptr %local.s_grad.1048
  %t1056 = load i64, ptr %local.nu
  %t1057 = call i64 @"burgers_detect"(i64 %t1056, i64 2)
  store i64 %t1057, ptr %local.s_energy.1049
  %t1058 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.120)
  %t1059 = ptrtoint ptr %t1058 to i64
  %t1060 = inttoptr i64 %t1059 to ptr
  call void @intrinsic_print(ptr %t1060)
  %t1061 = load i64, ptr %local.nu
  %t1062 = call i64 @"print_f64"(i64 %t1061)
  %t1063 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.121)
  %t1064 = ptrtoint ptr %t1063 to i64
  %t1065 = inttoptr i64 %t1064 to ptr
  call void @intrinsic_print(ptr %t1065)
  %t1066 = load i64, ptr %local.s_local.1047
  call void @print_i64(i64 %t1066)
  %t1067 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.122)
  %t1068 = ptrtoint ptr %t1067 to i64
  %t1069 = inttoptr i64 %t1068 to ptr
  call void @intrinsic_print(ptr %t1069)
  %t1070 = load i64, ptr %local.s_grad.1048
  call void @print_i64(i64 %t1070)
  %t1071 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.123)
  %t1072 = ptrtoint ptr %t1071 to i64
  %t1073 = inttoptr i64 %t1072 to ptr
  call void @intrinsic_print(ptr %t1073)
  %t1074 = load i64, ptr %local.s_energy.1049
  call void @print_i64(i64 %t1074)
  store i64 0, ptr %local.first.1050
  store i64 999999, ptr %local.first_step.1051
  %t1075 = load i64, ptr %local.s_local.1047
  %t1076 = icmp sge i64 %t1075, 0
  %t1077 = zext i1 %t1076 to i64
  %t1078 = icmp ne i64 %t1077, 0
  br i1 %t1078, label %then42, label %else42
then42:
  %t1079 = load i64, ptr %local.s_local.1047
  %t1080 = load i64, ptr %local.first_step.1051
  %t1081 = icmp slt i64 %t1079, %t1080
  %t1082 = zext i1 %t1081 to i64
  %t1083 = icmp ne i64 %t1082, 0
  br i1 %t1083, label %then43, label %else43
then43:
  %t1084 = load i64, ptr %local.s_local.1047
  store i64 %t1084, ptr %local.first_step.1051
  store i64 1, ptr %local.first.1050
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1085 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1086 = phi i64 [ %t1085, %then42_end ], [ 0, %else42_end ]
  %t1087 = load i64, ptr %local.s_grad.1048
  %t1088 = icmp sge i64 %t1087, 0
  %t1089 = zext i1 %t1088 to i64
  %t1090 = icmp ne i64 %t1089, 0
  br i1 %t1090, label %then44, label %else44
then44:
  %t1091 = load i64, ptr %local.s_grad.1048
  %t1092 = load i64, ptr %local.first_step.1051
  %t1093 = icmp slt i64 %t1091, %t1092
  %t1094 = zext i1 %t1093 to i64
  %t1095 = icmp ne i64 %t1094, 0
  br i1 %t1095, label %then45, label %else45
then45:
  %t1096 = load i64, ptr %local.s_grad.1048
  store i64 %t1096, ptr %local.first_step.1051
  store i64 2, ptr %local.first.1050
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1097 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1098 = phi i64 [ %t1097, %then44_end ], [ 0, %else44_end ]
  %t1099 = load i64, ptr %local.s_energy.1049
  %t1100 = icmp sge i64 %t1099, 0
  %t1101 = zext i1 %t1100 to i64
  %t1102 = icmp ne i64 %t1101, 0
  br i1 %t1102, label %then46, label %else46
then46:
  %t1103 = load i64, ptr %local.s_energy.1049
  %t1104 = load i64, ptr %local.first_step.1051
  %t1105 = icmp slt i64 %t1103, %t1104
  %t1106 = zext i1 %t1105 to i64
  %t1107 = icmp ne i64 %t1106, 0
  br i1 %t1107, label %then47, label %else47
then47:
  %t1108 = load i64, ptr %local.s_energy.1049
  store i64 %t1108, ptr %local.first_step.1051
  store i64 3, ptr %local.first.1050
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1109 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1110 = phi i64 [ %t1109, %then46_end ], [ 0, %else46_end ]
  %t1111 = load i64, ptr %local.first.1050
  %t1112 = icmp eq i64 %t1111, 0
  %t1113 = zext i1 %t1112 to i64
  %t1114 = icmp ne i64 %t1113, 0
  br i1 %t1114, label %then48, label %else48
then48:
  %t1115 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.124)
  %t1116 = ptrtoint ptr %t1115 to i64
  %t1117 = inttoptr i64 %t1116 to ptr
  call void @intrinsic_print(ptr %t1117)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1118 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1119 = load i64, ptr %local.first.1050
  %t1120 = icmp eq i64 %t1119, 1
  %t1121 = zext i1 %t1120 to i64
  %t1122 = icmp ne i64 %t1121, 0
  br i1 %t1122, label %then49, label %else49
then49:
  %t1123 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.125)
  %t1124 = ptrtoint ptr %t1123 to i64
  %t1125 = inttoptr i64 %t1124 to ptr
  call void @intrinsic_print(ptr %t1125)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1126 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t1127 = load i64, ptr %local.first.1050
  %t1128 = icmp eq i64 %t1127, 2
  %t1129 = zext i1 %t1128 to i64
  %t1130 = icmp ne i64 %t1129, 0
  br i1 %t1130, label %then50, label %else50
then50:
  %t1131 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.126)
  %t1132 = ptrtoint ptr %t1131 to i64
  %t1133 = inttoptr i64 %t1132 to ptr
  call void @intrinsic_print(ptr %t1133)
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1134 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1135 = load i64, ptr %local.first.1050
  %t1136 = icmp eq i64 %t1135, 3
  %t1137 = zext i1 %t1136 to i64
  %t1138 = icmp ne i64 %t1137, 0
  br i1 %t1138, label %then51, label %else51
then51:
  %t1139 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.127)
  %t1140 = ptrtoint ptr %t1139 to i64
  %t1141 = inttoptr i64 %t1140 to ptr
  call void @intrinsic_print(ptr %t1141)
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1142 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t1143 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.128)
  %t1144 = ptrtoint ptr %t1143 to i64
  %t1145 = inttoptr i64 %t1144 to ptr
  call void @intrinsic_println(ptr %t1145)
  ret i64 0
}

define i64 @"run_exp2"() nounwind {
entry:
  %t1146 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.129)
  %t1147 = ptrtoint ptr %t1146 to i64
  %t1148 = inttoptr i64 %t1147 to ptr
  call void @intrinsic_println(ptr %t1148)
  %t1149 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.130)
  %t1150 = ptrtoint ptr %t1149 to i64
  %t1151 = inttoptr i64 %t1150 to ptr
  call void @intrinsic_println(ptr %t1151)
  %t1152 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.131)
  %t1153 = ptrtoint ptr %t1152 to i64
  %t1154 = inttoptr i64 %t1153 to ptr
  call void @intrinsic_println(ptr %t1154)
  %t1155 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.132)
  %t1156 = ptrtoint ptr %t1155 to i64
  %t1157 = inttoptr i64 %t1156 to ptr
  call void @intrinsic_println(ptr %t1157)
  %t1158 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.133)
  %t1159 = ptrtoint ptr %t1158 to i64
  %t1160 = inttoptr i64 %t1159 to ptr
  call void @intrinsic_println(ptr %t1160)
  %t1161 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.134)
  %t1162 = ptrtoint ptr %t1161 to i64
  %t1163 = inttoptr i64 %t1162 to ptr
  call void @intrinsic_println(ptr %t1163)
  %t1164 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.135)
  %t1165 = ptrtoint ptr %t1164 to i64
  %t1166 = inttoptr i64 %t1165 to ptr
  call void @intrinsic_println(ptr %t1166)
  %t1167 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.136)
  %t1168 = ptrtoint ptr %t1167 to i64
  %t1169 = inttoptr i64 %t1168 to ptr
  call void @intrinsic_println(ptr %t1169)
  %t1170 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.137)
  %t1171 = ptrtoint ptr %t1170 to i64
  %t1172 = inttoptr i64 %t1171 to ptr
  call void @intrinsic_println(ptr %t1172)
  %t1173 = call i64 @f64_parse(ptr @.str.exp_predictive_s.138)
  %t1174 = call i64 @"run_exp2_for_nu"(i64 %t1173)
  %t1175 = call i64 @f64_parse(ptr @.str.exp_predictive_s.139)
  %t1176 = call i64 @"run_exp2_for_nu"(i64 %t1175)
  %t1177 = call i64 @f64_parse(ptr @.str.exp_predictive_s.140)
  %t1178 = call i64 @"run_exp2_for_nu"(i64 %t1177)
  %t1179 = call i64 @f64_parse(ptr @.str.exp_predictive_s.141)
  %t1180 = call i64 @"run_exp2_for_nu"(i64 %t1179)
  %t1181 = call i64 @f64_parse(ptr @.str.exp_predictive_s.142)
  %t1182 = call i64 @"run_exp2_for_nu"(i64 %t1181)
  %t1183 = call i64 @f64_parse(ptr @.str.exp_predictive_s.143)
  %t1184 = call i64 @"run_exp2_for_nu"(i64 %t1183)
  %t1185 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.144)
  %t1186 = ptrtoint ptr %t1185 to i64
  %t1187 = inttoptr i64 %t1186 to ptr
  call void @intrinsic_println(ptr %t1187)
  %t1188 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.145)
  %t1189 = ptrtoint ptr %t1188 to i64
  %t1190 = inttoptr i64 %t1189 to ptr
  call void @intrinsic_println(ptr %t1190)
  %t1191 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.146)
  %t1192 = ptrtoint ptr %t1191 to i64
  %t1193 = inttoptr i64 %t1192 to ptr
  call void @intrinsic_println(ptr %t1193)
  %t1194 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.147)
  %t1195 = ptrtoint ptr %t1194 to i64
  %t1196 = inttoptr i64 %t1195 to ptr
  call void @intrinsic_println(ptr %t1196)
  %t1197 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.148)
  %t1198 = ptrtoint ptr %t1197 to i64
  %t1199 = inttoptr i64 %t1198 to ptr
  call void @intrinsic_println(ptr %t1199)
  %t1200 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.149)
  %t1201 = ptrtoint ptr %t1200 to i64
  %t1202 = inttoptr i64 %t1201 to ptr
  call void @intrinsic_println(ptr %t1202)
  %t1203 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.150)
  %t1204 = ptrtoint ptr %t1203 to i64
  %t1205 = inttoptr i64 %t1204 to ptr
  call void @intrinsic_println(ptr %t1205)
  ret i64 0
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t1206 = load i64, ptr %local.state
  %t1207 = mul i64 %t1206, 1664525
  %t1208 = add i64 %t1207, 1013904223
  ret i64 %t1208
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.1209 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t1210 = load i64, ptr %local.state
  store i64 %t1210, ptr %local.s.1209
  %t1211 = load i64, ptr %local.s.1209
  %t1212 = icmp slt i64 %t1211, 0
  %t1213 = zext i1 %t1212 to i64
  %t1214 = icmp ne i64 %t1213, 0
  br i1 %t1214, label %then52, label %else52
then52:
  %t1215 = load i64, ptr %local.s.1209
  %t1216 = sub i64 0, %t1215
  store i64 %t1216, ptr %local.s.1209
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1217 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t1218 = load i64, ptr %local.s.1209
  %t1219 = srem i64 %t1218, 10000
  %t1220 = call i64 @"sx_int_to_f64"(i64 %t1219)
  %t1221 = call i64 @f64_parse(ptr @.str.exp_predictive_s.151)
  %t1222 = call i64 @"sx_f64_div"(i64 %t1220, i64 %t1221)
  ret i64 %t1222
}

define i64 @"belief_s_at_step"(i64 %belief, i64 %query_step) nounwind {
entry:
  %local.p_before.1223 = alloca i64
  %local.p_after.1224 = alloca i64
  %local.alpha.1225 = alloca i64
  %local.beta.1226 = alloca i64
  %local.rng.1227 = alloca i64
  %local.step.1228 = alloca i64
  %local.prev_drift.1229 = alloca i64
  %local.curr_drift.1230 = alloca i64
  %local.s_val.1231 = alloca i64
  %local.p_true.1232 = alloca i64
  %local.obs.1233 = alloca i64
  %local.mean.1234 = alloca i64
  %local.belief = alloca i64
  store i64 %belief, ptr %local.belief
  %local.query_step = alloca i64
  store i64 %query_step, ptr %local.query_step
  %t1235 = call i64 @f64_parse(ptr @.str.exp_predictive_s.152)
  store i64 %t1235, ptr %local.p_before.1223
  %t1236 = call i64 @f64_parse(ptr @.str.exp_predictive_s.153)
  store i64 %t1236, ptr %local.p_after.1224
  %t1237 = load i64, ptr %local.belief
  %t1238 = icmp eq i64 %t1237, 1
  %t1239 = zext i1 %t1238 to i64
  %t1240 = icmp ne i64 %t1239, 0
  br i1 %t1240, label %then53, label %else53
then53:
  %t1241 = call i64 @f64_parse(ptr @.str.exp_predictive_s.154)
  store i64 %t1241, ptr %local.p_before.1223
  %t1242 = call i64 @f64_parse(ptr @.str.exp_predictive_s.155)
  store i64 %t1242, ptr %local.p_after.1224
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1243 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t1244 = load i64, ptr %local.belief
  %t1245 = icmp eq i64 %t1244, 2
  %t1246 = zext i1 %t1245 to i64
  %t1247 = icmp ne i64 %t1246, 0
  br i1 %t1247, label %then54, label %else54
then54:
  %t1248 = call i64 @f64_parse(ptr @.str.exp_predictive_s.156)
  store i64 %t1248, ptr %local.p_before.1223
  %t1249 = call i64 @f64_parse(ptr @.str.exp_predictive_s.157)
  store i64 %t1249, ptr %local.p_after.1224
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t1250 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t1251 = call i64 @f64_parse(ptr @.str.exp_predictive_s.158)
  store i64 %t1251, ptr %local.alpha.1225
  %t1252 = call i64 @f64_parse(ptr @.str.exp_predictive_s.159)
  store i64 %t1252, ptr %local.beta.1226
  %t1253 = load i64, ptr %local.belief
  %t1254 = mul i64 %t1253, 1000
  %t1255 = add i64 42, %t1254
  store i64 %t1255, ptr %local.rng.1227
  store i64 0, ptr %local.step.1228
  %t1256 = call i64 @f64_parse(ptr @.str.exp_predictive_s.160)
  store i64 %t1256, ptr %local.prev_drift.1229
  %t1257 = call i64 @f64_parse(ptr @.str.exp_predictive_s.161)
  store i64 %t1257, ptr %local.curr_drift.1230
  %t1258 = call i64 @f64_parse(ptr @.str.exp_predictive_s.162)
  store i64 %t1258, ptr %local.s_val.1231
  br label %loop55
loop55:
  %t1259 = load i64, ptr %local.step.1228
  %t1260 = load i64, ptr %local.query_step
  %t1261 = icmp sle i64 %t1259, %t1260
  %t1262 = zext i1 %t1261 to i64
  %t1263 = icmp ne i64 %t1262, 0
  br i1 %t1263, label %body55, label %endloop55
body55:
  %t1264 = load i64, ptr %local.p_before.1223
  store i64 %t1264, ptr %local.p_true.1232
  %t1265 = load i64, ptr %local.step.1228
  %t1266 = icmp sge i64 %t1265, 100
  %t1267 = zext i1 %t1266 to i64
  %t1268 = icmp ne i64 %t1267, 0
  br i1 %t1268, label %then56, label %else56
then56:
  %t1269 = load i64, ptr %local.p_after.1224
  store i64 %t1269, ptr %local.p_true.1232
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t1270 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  store i64 0, ptr %local.obs.1233
  br label %loop57
loop57:
  %t1271 = load i64, ptr %local.obs.1233
  %t1272 = icmp slt i64 %t1271, 5
  %t1273 = zext i1 %t1272 to i64
  %t1274 = icmp ne i64 %t1273, 0
  br i1 %t1274, label %body57, label %endloop57
body57:
  %t1275 = load i64, ptr %local.rng.1227
  %t1276 = call i64 @"lcg_next"(i64 %t1275)
  store i64 %t1276, ptr %local.rng.1227
  %t1277 = load i64, ptr %local.rng.1227
  %t1278 = call i64 @"lcg_f64"(i64 %t1277)
  %t1279 = load i64, ptr %local.p_true.1232
  %t1280 = call i64 @"sx_f64_lt"(i64 %t1278, i64 %t1279)
  %t1281 = icmp ne i64 %t1280, 0
  br i1 %t1281, label %then58, label %else58
then58:
  %t1282 = load i64, ptr %local.alpha.1225
  %t1283 = call i64 @f64_parse(ptr @.str.exp_predictive_s.163)
  %t1284 = call i64 @"sx_f64_add"(i64 %t1282, i64 %t1283)
  store i64 %t1284, ptr %local.alpha.1225
  br label %then58_end
then58_end:
  br label %endif58
else58:
  %t1285 = load i64, ptr %local.beta.1226
  %t1286 = call i64 @f64_parse(ptr @.str.exp_predictive_s.164)
  %t1287 = call i64 @"sx_f64_add"(i64 %t1285, i64 %t1286)
  store i64 %t1287, ptr %local.beta.1226
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t1288 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t1289 = load i64, ptr %local.obs.1233
  %t1290 = add i64 %t1289, 1
  store i64 %t1290, ptr %local.obs.1233
  br label %loop57
endloop57:
  %t1291 = load i64, ptr %local.alpha.1225
  %t1292 = load i64, ptr %local.alpha.1225
  %t1293 = load i64, ptr %local.beta.1226
  %t1294 = call i64 @"sx_f64_add"(i64 %t1292, i64 %t1293)
  %t1295 = call i64 @"sx_f64_div"(i64 %t1291, i64 %t1294)
  store i64 %t1295, ptr %local.mean.1234
  %t1296 = load i64, ptr %local.mean.1234
  %t1297 = load i64, ptr %local.p_true.1232
  %t1298 = call i64 @"sx_f64_sub"(i64 %t1296, i64 %t1297)
  %t1299 = call i64 @"abs_f64"(i64 %t1298)
  store i64 %t1299, ptr %local.curr_drift.1230
  %t1300 = load i64, ptr %local.prev_drift.1229
  %t1301 = call i64 @f64_parse(ptr @.str.exp_predictive_s.165)
  %t1302 = call i64 @"sx_f64_gt"(i64 %t1300, i64 %t1301)
  %t1303 = icmp ne i64 %t1302, 0
  br i1 %t1303, label %then59, label %else59
then59:
  %t1304 = call i64 @f64_parse(ptr @.str.exp_predictive_s.166)
  %t1305 = load i64, ptr %local.curr_drift.1230
  %t1306 = load i64, ptr %local.prev_drift.1229
  %t1307 = call i64 @"sx_f64_div"(i64 %t1305, i64 %t1306)
  %t1308 = call i64 @"sx_f64_sub"(i64 %t1304, i64 %t1307)
  store i64 %t1308, ptr %local.s_val.1231
  br label %then59_end
then59_end:
  br label %endif59
else59:
  %t1309 = call i64 @f64_parse(ptr @.str.exp_predictive_s.167)
  store i64 %t1309, ptr %local.s_val.1231
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t1310 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t1311 = load i64, ptr %local.curr_drift.1230
  store i64 %t1311, ptr %local.prev_drift.1229
  %t1312 = load i64, ptr %local.step.1228
  %t1313 = add i64 %t1312, 1
  store i64 %t1313, ptr %local.step.1228
  br label %loop55
endloop55:
  %t1314 = load i64, ptr %local.s_val.1231
  ret i64 %t1314
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.step.1315 = alloca i64
  %local.s1.1316 = alloca i64
  %local.s2.1317 = alloca i64
  %local.s3.1318 = alloca i64
  %local.avg_before_1.1319 = alloca i64
  %local.avg_before_2.1320 = alloca i64
  %local.avg_before_3.1321 = alloca i64
  %local.avg_after_1.1322 = alloca i64
  %local.avg_after_2.1323 = alloca i64
  %local.avg_after_3.1324 = alloca i64
  %local.count_b.1325 = alloca i64
  %local.count_a.1326 = alloca i64
  %local.cb.1327 = alloca i64
  %local.ca.1328 = alloca i64
  %t1329 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.168)
  %t1330 = ptrtoint ptr %t1329 to i64
  %t1331 = inttoptr i64 %t1330 to ptr
  call void @intrinsic_println(ptr %t1331)
  %t1332 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.169)
  %t1333 = ptrtoint ptr %t1332 to i64
  %t1334 = inttoptr i64 %t1333 to ptr
  call void @intrinsic_println(ptr %t1334)
  %t1335 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.170)
  %t1336 = ptrtoint ptr %t1335 to i64
  %t1337 = inttoptr i64 %t1336 to ptr
  call void @intrinsic_println(ptr %t1337)
  %t1338 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.171)
  %t1339 = ptrtoint ptr %t1338 to i64
  %t1340 = inttoptr i64 %t1339 to ptr
  call void @intrinsic_println(ptr %t1340)
  %t1341 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.172)
  %t1342 = ptrtoint ptr %t1341 to i64
  %t1343 = inttoptr i64 %t1342 to ptr
  call void @intrinsic_println(ptr %t1343)
  %t1344 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.173)
  %t1345 = ptrtoint ptr %t1344 to i64
  %t1346 = inttoptr i64 %t1345 to ptr
  call void @intrinsic_println(ptr %t1346)
  %t1347 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.174)
  %t1348 = ptrtoint ptr %t1347 to i64
  %t1349 = inttoptr i64 %t1348 to ptr
  call void @intrinsic_println(ptr %t1349)
  %t1350 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.175)
  %t1351 = ptrtoint ptr %t1350 to i64
  %t1352 = inttoptr i64 %t1351 to ptr
  call void @intrinsic_println(ptr %t1352)
  %t1353 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.176)
  %t1354 = ptrtoint ptr %t1353 to i64
  %t1355 = inttoptr i64 %t1354 to ptr
  call void @intrinsic_println(ptr %t1355)
  %t1356 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.177)
  %t1357 = ptrtoint ptr %t1356 to i64
  %t1358 = inttoptr i64 %t1357 to ptr
  call void @intrinsic_println(ptr %t1358)
  store i64 80, ptr %local.step.1315
  br label %loop60
loop60:
  %t1359 = load i64, ptr %local.step.1315
  %t1360 = icmp sle i64 %t1359, 120
  %t1361 = zext i1 %t1360 to i64
  %t1362 = icmp ne i64 %t1361, 0
  br i1 %t1362, label %body60, label %endloop60
body60:
  %t1363 = load i64, ptr %local.step.1315
  %t1364 = call i64 @"belief_s_at_step"(i64 0, i64 %t1363)
  store i64 %t1364, ptr %local.s1.1316
  %t1365 = load i64, ptr %local.step.1315
  %t1366 = call i64 @"belief_s_at_step"(i64 1, i64 %t1365)
  store i64 %t1366, ptr %local.s2.1317
  %t1367 = load i64, ptr %local.step.1315
  %t1368 = call i64 @"belief_s_at_step"(i64 2, i64 %t1367)
  store i64 %t1368, ptr %local.s3.1318
  %t1369 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.178)
  %t1370 = ptrtoint ptr %t1369 to i64
  %t1371 = inttoptr i64 %t1370 to ptr
  call void @intrinsic_print(ptr %t1371)
  %t1372 = load i64, ptr %local.step.1315
  call void @print_i64(i64 %t1372)
  %t1373 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.179)
  %t1374 = ptrtoint ptr %t1373 to i64
  %t1375 = inttoptr i64 %t1374 to ptr
  call void @intrinsic_print(ptr %t1375)
  %t1376 = load i64, ptr %local.s1.1316
  %t1377 = call i64 @"print_f64"(i64 %t1376)
  %t1378 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.180)
  %t1379 = ptrtoint ptr %t1378 to i64
  %t1380 = inttoptr i64 %t1379 to ptr
  call void @intrinsic_print(ptr %t1380)
  %t1381 = load i64, ptr %local.s2.1317
  %t1382 = call i64 @"print_f64"(i64 %t1381)
  %t1383 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.181)
  %t1384 = ptrtoint ptr %t1383 to i64
  %t1385 = inttoptr i64 %t1384 to ptr
  call void @intrinsic_print(ptr %t1385)
  %t1386 = load i64, ptr %local.s3.1318
  %t1387 = call i64 @"print_f64"(i64 %t1386)
  %t1388 = load i64, ptr %local.step.1315
  %t1389 = icmp slt i64 %t1388, 100
  %t1390 = zext i1 %t1389 to i64
  %t1391 = icmp ne i64 %t1390, 0
  br i1 %t1391, label %then61, label %else61
then61:
  %t1392 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.182)
  %t1393 = ptrtoint ptr %t1392 to i64
  %t1394 = inttoptr i64 %t1393 to ptr
  call void @intrinsic_print(ptr %t1394)
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t1395 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t1396 = load i64, ptr %local.step.1315
  %t1397 = icmp eq i64 %t1396, 100
  %t1398 = zext i1 %t1397 to i64
  %t1399 = icmp ne i64 %t1398, 0
  br i1 %t1399, label %then62, label %else62
then62:
  %t1400 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.183)
  %t1401 = ptrtoint ptr %t1400 to i64
  %t1402 = inttoptr i64 %t1401 to ptr
  call void @intrinsic_print(ptr %t1402)
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t1403 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  %t1404 = load i64, ptr %local.step.1315
  %t1405 = icmp sgt i64 %t1404, 100
  %t1406 = zext i1 %t1405 to i64
  %t1407 = icmp ne i64 %t1406, 0
  br i1 %t1407, label %then63, label %else63
then63:
  %t1408 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.184)
  %t1409 = ptrtoint ptr %t1408 to i64
  %t1410 = inttoptr i64 %t1409 to ptr
  call void @intrinsic_print(ptr %t1410)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1411 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t1412 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.185)
  %t1413 = ptrtoint ptr %t1412 to i64
  %t1414 = inttoptr i64 %t1413 to ptr
  call void @intrinsic_println(ptr %t1414)
  %t1415 = load i64, ptr %local.step.1315
  %t1416 = add i64 %t1415, 2
  store i64 %t1416, ptr %local.step.1315
  br label %loop60
endloop60:
  %t1417 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.186)
  %t1418 = ptrtoint ptr %t1417 to i64
  %t1419 = inttoptr i64 %t1418 to ptr
  call void @intrinsic_println(ptr %t1419)
  %t1420 = call i64 @f64_parse(ptr @.str.exp_predictive_s.187)
  store i64 %t1420, ptr %local.avg_before_1.1319
  %t1421 = call i64 @f64_parse(ptr @.str.exp_predictive_s.188)
  store i64 %t1421, ptr %local.avg_before_2.1320
  %t1422 = call i64 @f64_parse(ptr @.str.exp_predictive_s.189)
  store i64 %t1422, ptr %local.avg_before_3.1321
  %t1423 = call i64 @f64_parse(ptr @.str.exp_predictive_s.190)
  store i64 %t1423, ptr %local.avg_after_1.1322
  %t1424 = call i64 @f64_parse(ptr @.str.exp_predictive_s.191)
  store i64 %t1424, ptr %local.avg_after_2.1323
  %t1425 = call i64 @f64_parse(ptr @.str.exp_predictive_s.192)
  store i64 %t1425, ptr %local.avg_after_3.1324
  store i64 0, ptr %local.count_b.1325
  store i64 0, ptr %local.count_a.1326
  store i64 80, ptr %local.step.1315
  br label %loop64
loop64:
  %t1426 = load i64, ptr %local.step.1315
  %t1427 = icmp slt i64 %t1426, 100
  %t1428 = zext i1 %t1427 to i64
  %t1429 = icmp ne i64 %t1428, 0
  br i1 %t1429, label %body64, label %endloop64
body64:
  %t1430 = load i64, ptr %local.avg_before_1.1319
  %t1431 = load i64, ptr %local.step.1315
  %t1432 = call i64 @"belief_s_at_step"(i64 0, i64 %t1431)
  %t1433 = call i64 @"sx_f64_add"(i64 %t1430, i64 %t1432)
  store i64 %t1433, ptr %local.avg_before_1.1319
  %t1434 = load i64, ptr %local.avg_before_2.1320
  %t1435 = load i64, ptr %local.step.1315
  %t1436 = call i64 @"belief_s_at_step"(i64 1, i64 %t1435)
  %t1437 = call i64 @"sx_f64_add"(i64 %t1434, i64 %t1436)
  store i64 %t1437, ptr %local.avg_before_2.1320
  %t1438 = load i64, ptr %local.avg_before_3.1321
  %t1439 = load i64, ptr %local.step.1315
  %t1440 = call i64 @"belief_s_at_step"(i64 2, i64 %t1439)
  %t1441 = call i64 @"sx_f64_add"(i64 %t1438, i64 %t1440)
  store i64 %t1441, ptr %local.avg_before_3.1321
  %t1442 = load i64, ptr %local.count_b.1325
  %t1443 = add i64 %t1442, 1
  store i64 %t1443, ptr %local.count_b.1325
  %t1444 = load i64, ptr %local.step.1315
  %t1445 = add i64 %t1444, 2
  store i64 %t1445, ptr %local.step.1315
  br label %loop64
endloop64:
  store i64 101, ptr %local.step.1315
  br label %loop65
loop65:
  %t1446 = load i64, ptr %local.step.1315
  %t1447 = icmp sle i64 %t1446, 120
  %t1448 = zext i1 %t1447 to i64
  %t1449 = icmp ne i64 %t1448, 0
  br i1 %t1449, label %body65, label %endloop65
body65:
  %t1450 = load i64, ptr %local.avg_after_1.1322
  %t1451 = load i64, ptr %local.step.1315
  %t1452 = call i64 @"belief_s_at_step"(i64 0, i64 %t1451)
  %t1453 = call i64 @"sx_f64_add"(i64 %t1450, i64 %t1452)
  store i64 %t1453, ptr %local.avg_after_1.1322
  %t1454 = load i64, ptr %local.avg_after_2.1323
  %t1455 = load i64, ptr %local.step.1315
  %t1456 = call i64 @"belief_s_at_step"(i64 1, i64 %t1455)
  %t1457 = call i64 @"sx_f64_add"(i64 %t1454, i64 %t1456)
  store i64 %t1457, ptr %local.avg_after_2.1323
  %t1458 = load i64, ptr %local.avg_after_3.1324
  %t1459 = load i64, ptr %local.step.1315
  %t1460 = call i64 @"belief_s_at_step"(i64 2, i64 %t1459)
  %t1461 = call i64 @"sx_f64_add"(i64 %t1458, i64 %t1460)
  store i64 %t1461, ptr %local.avg_after_3.1324
  %t1462 = load i64, ptr %local.count_a.1326
  %t1463 = add i64 %t1462, 1
  store i64 %t1463, ptr %local.count_a.1326
  %t1464 = load i64, ptr %local.step.1315
  %t1465 = add i64 %t1464, 2
  store i64 %t1465, ptr %local.step.1315
  br label %loop65
endloop65:
  %t1466 = load i64, ptr %local.count_b.1325
  %t1467 = call i64 @"sx_int_to_f64"(i64 %t1466)
  store i64 %t1467, ptr %local.cb.1327
  %t1468 = load i64, ptr %local.count_a.1326
  %t1469 = call i64 @"sx_int_to_f64"(i64 %t1468)
  store i64 %t1469, ptr %local.ca.1328
  %t1470 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.193)
  %t1471 = ptrtoint ptr %t1470 to i64
  %t1472 = inttoptr i64 %t1471 to ptr
  call void @intrinsic_println(ptr %t1472)
  %t1473 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.194)
  %t1474 = ptrtoint ptr %t1473 to i64
  %t1475 = inttoptr i64 %t1474 to ptr
  call void @intrinsic_print(ptr %t1475)
  %t1476 = load i64, ptr %local.avg_before_1.1319
  %t1477 = load i64, ptr %local.cb.1327
  %t1478 = call i64 @"sx_f64_div"(i64 %t1476, i64 %t1477)
  %t1479 = call i64 @"print_f64"(i64 %t1478)
  %t1480 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.195)
  %t1481 = ptrtoint ptr %t1480 to i64
  %t1482 = inttoptr i64 %t1481 to ptr
  call void @intrinsic_print(ptr %t1482)
  %t1483 = load i64, ptr %local.avg_after_1.1322
  %t1484 = load i64, ptr %local.ca.1328
  %t1485 = call i64 @"sx_f64_div"(i64 %t1483, i64 %t1484)
  %t1486 = call i64 @"print_f64"(i64 %t1485)
  %t1487 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.196)
  %t1488 = ptrtoint ptr %t1487 to i64
  %t1489 = inttoptr i64 %t1488 to ptr
  call void @intrinsic_println(ptr %t1489)
  %t1490 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.197)
  %t1491 = ptrtoint ptr %t1490 to i64
  %t1492 = inttoptr i64 %t1491 to ptr
  call void @intrinsic_print(ptr %t1492)
  %t1493 = load i64, ptr %local.avg_before_2.1320
  %t1494 = load i64, ptr %local.cb.1327
  %t1495 = call i64 @"sx_f64_div"(i64 %t1493, i64 %t1494)
  %t1496 = call i64 @"print_f64"(i64 %t1495)
  %t1497 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.198)
  %t1498 = ptrtoint ptr %t1497 to i64
  %t1499 = inttoptr i64 %t1498 to ptr
  call void @intrinsic_print(ptr %t1499)
  %t1500 = load i64, ptr %local.avg_after_2.1323
  %t1501 = load i64, ptr %local.ca.1328
  %t1502 = call i64 @"sx_f64_div"(i64 %t1500, i64 %t1501)
  %t1503 = call i64 @"print_f64"(i64 %t1502)
  %t1504 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.199)
  %t1505 = ptrtoint ptr %t1504 to i64
  %t1506 = inttoptr i64 %t1505 to ptr
  call void @intrinsic_println(ptr %t1506)
  %t1507 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.200)
  %t1508 = ptrtoint ptr %t1507 to i64
  %t1509 = inttoptr i64 %t1508 to ptr
  call void @intrinsic_print(ptr %t1509)
  %t1510 = load i64, ptr %local.avg_before_3.1321
  %t1511 = load i64, ptr %local.cb.1327
  %t1512 = call i64 @"sx_f64_div"(i64 %t1510, i64 %t1511)
  %t1513 = call i64 @"print_f64"(i64 %t1512)
  %t1514 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.201)
  %t1515 = ptrtoint ptr %t1514 to i64
  %t1516 = inttoptr i64 %t1515 to ptr
  call void @intrinsic_print(ptr %t1516)
  %t1517 = load i64, ptr %local.avg_after_3.1324
  %t1518 = load i64, ptr %local.ca.1328
  %t1519 = call i64 @"sx_f64_div"(i64 %t1517, i64 %t1518)
  %t1520 = call i64 @"print_f64"(i64 %t1519)
  %t1521 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.202)
  %t1522 = ptrtoint ptr %t1521 to i64
  %t1523 = inttoptr i64 %t1522 to ptr
  call void @intrinsic_println(ptr %t1523)
  %t1524 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.203)
  %t1525 = ptrtoint ptr %t1524 to i64
  %t1526 = inttoptr i64 %t1525 to ptr
  call void @intrinsic_println(ptr %t1526)
  %t1527 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.204)
  %t1528 = ptrtoint ptr %t1527 to i64
  %t1529 = inttoptr i64 %t1528 to ptr
  call void @intrinsic_println(ptr %t1529)
  %t1530 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.205)
  %t1531 = ptrtoint ptr %t1530 to i64
  %t1532 = inttoptr i64 %t1531 to ptr
  call void @intrinsic_println(ptr %t1532)
  %t1533 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.206)
  %t1534 = ptrtoint ptr %t1533 to i64
  %t1535 = inttoptr i64 %t1534 to ptr
  call void @intrinsic_println(ptr %t1535)
  %t1536 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.207)
  %t1537 = ptrtoint ptr %t1536 to i64
  %t1538 = inttoptr i64 %t1537 to ptr
  call void @intrinsic_println(ptr %t1538)
  %t1539 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.208)
  %t1540 = ptrtoint ptr %t1539 to i64
  %t1541 = inttoptr i64 %t1540 to ptr
  call void @intrinsic_println(ptr %t1541)
  %t1542 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.209)
  %t1543 = ptrtoint ptr %t1542 to i64
  %t1544 = inttoptr i64 %t1543 to ptr
  call void @intrinsic_println(ptr %t1544)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1545 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.210)
  %t1546 = ptrtoint ptr %t1545 to i64
  %t1547 = inttoptr i64 %t1546 to ptr
  call void @intrinsic_println(ptr %t1547)
  %t1548 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.211)
  %t1549 = ptrtoint ptr %t1548 to i64
  %t1550 = inttoptr i64 %t1549 to ptr
  call void @intrinsic_println(ptr %t1550)
  %t1551 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.212)
  %t1552 = ptrtoint ptr %t1551 to i64
  %t1553 = inttoptr i64 %t1552 to ptr
  call void @intrinsic_println(ptr %t1553)
  %t1554 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.213)
  %t1555 = ptrtoint ptr %t1554 to i64
  %t1556 = inttoptr i64 %t1555 to ptr
  call void @intrinsic_println(ptr %t1556)
  %t1557 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.214)
  %t1558 = ptrtoint ptr %t1557 to i64
  %t1559 = inttoptr i64 %t1558 to ptr
  call void @intrinsic_println(ptr %t1559)
  %t1560 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.215)
  %t1561 = ptrtoint ptr %t1560 to i64
  %t1562 = inttoptr i64 %t1561 to ptr
  call void @intrinsic_println(ptr %t1562)
  %t1563 = call i64 @"run_exp1"()
  %t1564 = call i64 @"run_exp2"()
  %t1565 = call i64 @"run_exp3"()
  %t1566 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.216)
  %t1567 = ptrtoint ptr %t1566 to i64
  %t1568 = inttoptr i64 %t1567 to ptr
  call void @intrinsic_println(ptr %t1568)
  %t1569 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.217)
  %t1570 = ptrtoint ptr %t1569 to i64
  %t1571 = inttoptr i64 %t1570 to ptr
  call void @intrinsic_println(ptr %t1571)
  %t1572 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.218)
  %t1573 = ptrtoint ptr %t1572 to i64
  %t1574 = inttoptr i64 %t1573 to ptr
  call void @intrinsic_println(ptr %t1574)
  %t1575 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.219)
  %t1576 = ptrtoint ptr %t1575 to i64
  %t1577 = inttoptr i64 %t1576 to ptr
  call void @intrinsic_println(ptr %t1577)
  %t1578 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.220)
  %t1579 = ptrtoint ptr %t1578 to i64
  %t1580 = inttoptr i64 %t1579 to ptr
  call void @intrinsic_println(ptr %t1580)
  %t1581 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.221)
  %t1582 = ptrtoint ptr %t1581 to i64
  %t1583 = inttoptr i64 %t1582 to ptr
  call void @intrinsic_println(ptr %t1583)
  %t1584 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.222)
  %t1585 = ptrtoint ptr %t1584 to i64
  %t1586 = inttoptr i64 %t1585 to ptr
  call void @intrinsic_println(ptr %t1586)
  %t1587 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.223)
  %t1588 = ptrtoint ptr %t1587 to i64
  %t1589 = inttoptr i64 %t1588 to ptr
  call void @intrinsic_println(ptr %t1589)
  %t1590 = call ptr @intrinsic_string_new(ptr @.str.exp_predictive_s.224)
  %t1591 = ptrtoint ptr %t1590 to i64
  %t1592 = inttoptr i64 %t1591 to ptr
  call void @intrinsic_println(ptr %t1592)
  ret i64 0
}


; String constants
@.str.exp_predictive_s.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.2 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_predictive_s.3 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_predictive_s.4 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_predictive_s.5 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_predictive_s.6 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_predictive_s.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.8 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_predictive_s.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.12 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_predictive_s.13 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_predictive_s.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.19 = private unnamed_addr constant [9 x i8] c"999999.0\00"
@.str.exp_predictive_s.20 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_predictive_s.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.25 = private unnamed_addr constant [9 x i8] c"999999.0\00"
@.str.exp_predictive_s.26 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_predictive_s.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.31 = private unnamed_addr constant [9 x i8] c"999999.0\00"
@.str.exp_predictive_s.32 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_predictive_s.33 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_predictive_s.34 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_predictive_s.35 = private unnamed_addr constant [7 x i8] c"  r = \00"
@.str.exp_predictive_s.36 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.38 = private unnamed_addr constant [9 x i8] c"999999.0\00"
@.str.exp_predictive_s.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.40 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_predictive_s.41 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_predictive_s.42 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_predictive_s.43 = private unnamed_addr constant [16 x i8] c"    Learned: a=\00"
@.str.exp_predictive_s.44 = private unnamed_addr constant [4 x i8] c" b=\00"
@.str.exp_predictive_s.45 = private unnamed_addr constant [4 x i8] c" c=\00"
@.str.exp_predictive_s.46 = private unnamed_addr constant [4 x i8] c" d=\00"
@.str.exp_predictive_s.47 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.48 = private unnamed_addr constant [17 x i8] c"    Train RMSE: \00"
@.str.exp_predictive_s.49 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.50 = private unnamed_addr constant [17 x i8] c"    Test  RMSE: \00"
@.str.exp_predictive_s.51 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.52 = private unnamed_addr constant [10 x i8] c"    S(0)=\00"
@.str.exp_predictive_s.53 = private unnamed_addr constant [9 x i8] c"  S(50)=\00"
@.str.exp_predictive_s.54 = private unnamed_addr constant [10 x i8] c"  S(150)=\00"
@.str.exp_predictive_s.55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.56 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.57 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_predictive_s.58 = private unnamed_addr constant [49 x i8] c"  EXP 1: PREDICT S(t+1) FROM S(t), S'(t), S''(t)\00"
@.str.exp_predictive_s.59 = private unnamed_addr constant [39 x i8] c"  Logistic map, 200 windows of size 50\00"
@.str.exp_predictive_s.60 = private unnamed_addr constant [48 x i8] c"  Linear model: S_pred = a*S + b*S' + c*S'' + d\00"
@.str.exp_predictive_s.61 = private unnamed_addr constant [42 x i8] c"  Train on windows 2-101, test on 102-199\00"
@.str.exp_predictive_s.62 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_predictive_s.63 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.64 = private unnamed_addr constant [4 x i8] c"2.8\00"
@.str.exp_predictive_s.65 = private unnamed_addr constant [4 x i8] c"3.2\00"
@.str.exp_predictive_s.66 = private unnamed_addr constant [4 x i8] c"3.7\00"
@.str.exp_predictive_s.67 = private unnamed_addr constant [18 x i8] c"  INTERPRETATION:\00"
@.str.exp_predictive_s.68 = private unnamed_addr constant [61 x i8] c"  - Low test RMSE = S is predictable => blow-up forecastable\00"
@.str.exp_predictive_s.69 = private unnamed_addr constant [58 x i8] c"  - High test RMSE in chaos = fundamentally unpredictable\00"
@.str.exp_predictive_s.70 = private unnamed_addr constant [54 x i8] c"  - If a~1, b~0, c~0 => S is nearly constant (boring)\00"
@.str.exp_predictive_s.71 = private unnamed_addr constant [51 x i8] c"  - If b,c matter => derivatives carry information\00"
@.str.exp_predictive_s.72 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.73 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.74 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.76 = private unnamed_addr constant [23 x i8] c"3.14159265358979323846\00"
@.str.exp_predictive_s.77 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_predictive_s.78 = private unnamed_addr constant [8 x i8] c"0.00002\00"
@.str.exp_predictive_s.79 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.80 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.81 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.82 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_predictive_s.83 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.84 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_predictive_s.85 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.86 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_predictive_s.87 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.88 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_predictive_s.89 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.90 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_predictive_s.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.92 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_predictive_s.93 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.94 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_predictive_s.95 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.96 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_predictive_s.97 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.98 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_predictive_s.99 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.100 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.101 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.102 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.103 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_predictive_s.104 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_predictive_s.105 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_predictive_s.106 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.107 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.108 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.109 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.110 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.111 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.112 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.113 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.114 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.115 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.116 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.117 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.118 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.119 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.120 = private unnamed_addr constant [6 x i8] c"  nu=\00"
@.str.exp_predictive_s.121 = private unnamed_addr constant [11 x i8] c"  S_local=\00"
@.str.exp_predictive_s.122 = private unnamed_addr constant [14 x i8] c"  S_gradient=\00"
@.str.exp_predictive_s.123 = private unnamed_addr constant [12 x i8] c"  S_energy=\00"
@.str.exp_predictive_s.124 = private unnamed_addr constant [12 x i8] c"  => STABLE\00"
@.str.exp_predictive_s.125 = private unnamed_addr constant [37 x i8] c"  => LOCAL first (point instability)\00"
@.str.exp_predictive_s.126 = private unnamed_addr constant [36 x i8] c"  => GRADIENT first (shock forming)\00"
@.str.exp_predictive_s.127 = private unnamed_addr constant [40 x i8] c"  => ENERGY first (overall instability)\00"
@.str.exp_predictive_s.128 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.129 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_predictive_s.130 = private unnamed_addr constant [43 x i8] c"  EXP 2: MULTI-SCALE S ON BURGERS EQUATION\00"
@.str.exp_predictive_s.131 = private unnamed_addr constant [47 x i8] c"  10-point periodic grid, u(x,0) = sin(2*pi*x)\00"
@.str.exp_predictive_s.132 = private unnamed_addr constant [47 x i8] c"  Three S diagnostics: local, gradient, energy\00"
@.str.exp_predictive_s.133 = private unnamed_addr constant [52 x i8] c"  Which goes negative first => WHERE trouble starts\00"
@.str.exp_predictive_s.134 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_predictive_s.135 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.136 = private unnamed_addr constant [50 x i8] c"  Sweeping viscosity nu from turbulent to stable:\00"
@.str.exp_predictive_s.137 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.138 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_predictive_s.139 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_predictive_s.140 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_predictive_s.141 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_predictive_s.142 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_predictive_s.143 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_predictive_s.144 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.145 = private unnamed_addr constant [18 x i8] c"  INTERPRETATION:\00"
@.str.exp_predictive_s.146 = private unnamed_addr constant [61 x i8] c"  - Low nu: gradient S goes negative first (shock formation)\00"
@.str.exp_predictive_s.147 = private unnamed_addr constant [56 x i8] c"  - Medium nu: local S may go first (point instability)\00"
@.str.exp_predictive_s.148 = private unnamed_addr constant [46 x i8] c"  - High nu: all stable (diffusion dominates)\00"
@.str.exp_predictive_s.149 = private unnamed_addr constant [58 x i8] c"  - S_energy last = global stability lags local detection\00"
@.str.exp_predictive_s.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.151 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_predictive_s.152 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_predictive_s.153 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_predictive_s.154 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_predictive_s.155 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_predictive_s.156 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_predictive_s.157 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_predictive_s.158 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.159 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_predictive_s.160 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_predictive_s.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.162 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.163 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_predictive_s.164 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_predictive_s.165 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_predictive_s.166 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_predictive_s.167 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.168 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_predictive_s.169 = private unnamed_addr constant [42 x i8] c"  EXP 3: S FORECASTING FOR BELIEF SYSTEMS\00"
@.str.exp_predictive_s.170 = private unnamed_addr constant [44 x i8] c"  3 beliefs, true values CHANGE at step 100\00"
@.str.exp_predictive_s.171 = private unnamed_addr constant [33 x i8] c"  Before: p1=0.7, p2=0.5, p3=0.3\00"
@.str.exp_predictive_s.172 = private unnamed_addr constant [33 x i8] c"  After:  p1=0.3, p2=0.8, p3=0.6\00"
@.str.exp_predictive_s.173 = private unnamed_addr constant [30 x i8] c"  Track S from step 80 to 120\00"
@.str.exp_predictive_s.174 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_predictive_s.175 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.176 = private unnamed_addr constant [55 x i8] c"  Step   S(belief1)   S(belief2)   S(belief3)   Regime\00"
@.str.exp_predictive_s.177 = private unnamed_addr constant [55 x i8] c"  ----   ----------   ----------   ----------   ------\00"
@.str.exp_predictive_s.178 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_predictive_s.179 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_predictive_s.180 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_predictive_s.181 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_predictive_s.182 = private unnamed_addr constant [12 x i8] c"     BEFORE\00"
@.str.exp_predictive_s.183 = private unnamed_addr constant [12 x i8] c"     CHANGE\00"
@.str.exp_predictive_s.184 = private unnamed_addr constant [11 x i8] c"     AFTER\00"
@.str.exp_predictive_s.185 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.186 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.187 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.188 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.189 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.191 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.192 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_predictive_s.193 = private unnamed_addr constant [11 x i8] c"  Summary:\00"
@.str.exp_predictive_s.194 = private unnamed_addr constant [28 x i8] c"    Belief 1 avg S: before=\00"
@.str.exp_predictive_s.195 = private unnamed_addr constant [9 x i8] c"  after=\00"
@.str.exp_predictive_s.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.197 = private unnamed_addr constant [28 x i8] c"    Belief 2 avg S: before=\00"
@.str.exp_predictive_s.198 = private unnamed_addr constant [9 x i8] c"  after=\00"
@.str.exp_predictive_s.199 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.200 = private unnamed_addr constant [28 x i8] c"    Belief 3 avg S: before=\00"
@.str.exp_predictive_s.201 = private unnamed_addr constant [9 x i8] c"  after=\00"
@.str.exp_predictive_s.202 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.203 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.204 = private unnamed_addr constant [18 x i8] c"  INTERPRETATION:\00"
@.str.exp_predictive_s.205 = private unnamed_addr constant [58 x i8] c"  - S drop at step 100 = system DETECTS the regime change\00"
@.str.exp_predictive_s.206 = private unnamed_addr constant [60 x i8] c"  - S drop BEFORE step 100 = leading indicator (prediction)\00"
@.str.exp_predictive_s.207 = private unnamed_addr constant [56 x i8] c"  - Larger S change = bigger sensitivity to truth shift\00"
@.str.exp_predictive_s.208 = private unnamed_addr constant [59 x i8] c"  - For Anima: monitor S to anticipate environment changes\00"
@.str.exp_predictive_s.209 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.210 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_predictive_s.211 = private unnamed_addr constant [65 x i8] c"#  PREDICTIVE S: Can S Forecast the Future?                    #\00"
@.str.exp_predictive_s.212 = private unnamed_addr constant [65 x i8] c"#  Three experiments on prediction, multi-scale detection,     #\00"
@.str.exp_predictive_s.213 = private unnamed_addr constant [65 x i8] c"#  and belief regime change.                                   #\00"
@.str.exp_predictive_s.214 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_predictive_s.215 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_predictive_s.216 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_predictive_s.217 = private unnamed_addr constant [65 x i8] c"#  CONCLUSIONS                                                 #\00"
@.str.exp_predictive_s.218 = private unnamed_addr constant [64 x i8] c"#  1. If test RMSE << S magnitude, S is predictable and we    #\00"
@.str.exp_predictive_s.219 = private unnamed_addr constant [65 x i8] c"#     can forecast blow-up before it happens.                  #\00"
@.str.exp_predictive_s.220 = private unnamed_addr constant [65 x i8] c"#  2. Multi-scale S reveals WHERE instability starts:          #\00"
@.str.exp_predictive_s.221 = private unnamed_addr constant [64 x i8] c"#     gradient S fires first for shocks, local for points.    #\00"
@.str.exp_predictive_s.222 = private unnamed_addr constant [65 x i8] c"#  3. S drop at regime change gives detection/prediction       #\00"
@.str.exp_predictive_s.223 = private unnamed_addr constant [65 x i8] c"#     capability for belief systems and Anima agents.          #\00"
@.str.exp_predictive_s.224 = private unnamed_addr constant [65 x i8] c"################################################################\00"
