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
  %t1 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"is_prime"(i64 %n) nounwind {
entry:
  %local.d.9 = alloca i64
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t10 = load i64, ptr %local.n
  %t11 = icmp slt i64 %t10, 2
  %t12 = zext i1 %t11 to i64
  %t13 = icmp ne i64 %t12, 0
  br i1 %t13, label %then1, label %else1
then1:
  ret i64 0
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.n
  %t16 = icmp eq i64 %t15, 2
  %t17 = zext i1 %t16 to i64
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  ret i64 1
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t19 = phi i64 [ 0, %else2_end ]
  %t20 = load i64, ptr %local.n
  %t21 = srem i64 %t20, 2
  %t22 = icmp eq i64 %t21, 0
  %t23 = zext i1 %t22 to i64
  %t24 = icmp ne i64 %t23, 0
  br i1 %t24, label %then3, label %else3
then3:
  ret i64 0
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t25 = phi i64 [ 0, %else3_end ]
  store i64 3, ptr %local.d.9
  br label %loop4
loop4:
  %t26 = load i64, ptr %local.d.9
  %t27 = load i64, ptr %local.d.9
  %t28 = mul i64 %t26, %t27
  %t29 = load i64, ptr %local.n
  %t30 = icmp sle i64 %t28, %t29
  %t31 = zext i1 %t30 to i64
  %t32 = icmp ne i64 %t31, 0
  br i1 %t32, label %body4, label %endloop4
body4:
  %t33 = load i64, ptr %local.n
  %t34 = load i64, ptr %local.d.9
  %t35 = srem i64 %t33, %t34
  %t36 = icmp eq i64 %t35, 0
  %t37 = zext i1 %t36 to i64
  %t38 = icmp ne i64 %t37, 0
  br i1 %t38, label %then5, label %else5
then5:
  ret i64 0
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t39 = phi i64 [ 0, %else5_end ]
  %t40 = load i64, ptr %local.d.9
  %t41 = add i64 %t40, 2
  store i64 %t41, ptr %local.d.9
  br label %loop4
endloop4:
  ret i64 1
}

define i64 @"next_prime"(i64 %n) nounwind {
entry:
  %local.c.42 = alloca i64
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t43 = load i64, ptr %local.n
  %t44 = add i64 %t43, 1
  store i64 %t44, ptr %local.c.42
  br label %loop6
loop6:
  %t45 = load i64, ptr %local.c.42
  %t46 = call i64 @"is_prime"(i64 %t45)
  %t47 = icmp eq i64 %t46, 0
  %t48 = zext i1 %t47 to i64
  %t49 = icmp ne i64 %t48, 0
  br i1 %t49, label %body6, label %endloop6
body6:
  %t50 = load i64, ptr %local.c.42
  %t51 = add i64 %t50, 1
  store i64 %t51, ptr %local.c.42
  br label %loop6
endloop6:
  %t52 = load i64, ptr %local.c.42
  ret i64 %t52
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.p_prev.53 = alloca i64
  %local.p_curr.54 = alloca i64
  %local.prime_idx.55 = alloca i64
  %local.gap_0.56 = alloca i64
  %local.gap_1.57 = alloca i64
  %local.gap_2.58 = alloca i64
  %local.gap_3.59 = alloca i64
  %local.gp_0.60 = alloca i64
  %local.gp_1.61 = alloca i64
  %local.gp_2.62 = alloca i64
  %local.gpp_0.63 = alloca i64
  %local.gpp_1.64 = alloca i64
  %local.gppp.65 = alloca i64
  %local.gap_count.66 = alloca i64
  %local.sum_g.67 = alloca i64
  %local.sum_gp.68 = alloca i64
  %local.sum_abs_gp.69 = alloca i64
  %local.sign_g.70 = alloca i64
  %local.sign_gp.71 = alloca i64
  %local.sign_gpp.72 = alloca i64
  %local.sign_gppp.73 = alloca i64
  %local.prev_sign_gp.74 = alloca i64
  %local.prev_sign_gpp.75 = alloca i64
  %local.prev_sign_gppp.76 = alloca i64
  %local.total_gaps.77 = alloca i64
  %local.total_gp.78 = alloca i64
  %local.total_gpp.79 = alloca i64
  %local.total_gppp.80 = alloca i64
  %local.p_next.81 = alloca i64
  %local.new_gap.82 = alloca i64
  %local.cur_sign_gp.83 = alloca i64
  %local.cur_sign_gpp.84 = alloca i64
  %local.cur_sign_gppp.85 = alloca i64
  %local.ratio_gp.86 = alloca i64
  %local.ratio_gpp.87 = alloca i64
  %local.ratio_gppp.88 = alloca i64
  %t89 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.2)
  %t90 = ptrtoint ptr %t89 to i64
  %t91 = inttoptr i64 %t90 to ptr
  call void @intrinsic_println(ptr %t91)
  %t92 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.3)
  %t93 = ptrtoint ptr %t92 to i64
  %t94 = inttoptr i64 %t93 to ptr
  call void @intrinsic_println(ptr %t94)
  %t95 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.4)
  %t96 = ptrtoint ptr %t95 to i64
  %t97 = inttoptr i64 %t96 to ptr
  call void @intrinsic_println(ptr %t97)
  %t98 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.5)
  %t99 = ptrtoint ptr %t98 to i64
  %t100 = inttoptr i64 %t99 to ptr
  call void @intrinsic_println(ptr %t100)
  %t101 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.6)
  %t102 = ptrtoint ptr %t101 to i64
  %t103 = inttoptr i64 %t102 to ptr
  call void @intrinsic_println(ptr %t103)
  %t104 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.7)
  %t105 = ptrtoint ptr %t104 to i64
  %t106 = inttoptr i64 %t105 to ptr
  call void @intrinsic_println(ptr %t106)
  %t107 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.8)
  %t108 = ptrtoint ptr %t107 to i64
  %t109 = inttoptr i64 %t108 to ptr
  call void @intrinsic_println(ptr %t109)
  %t110 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.9)
  %t111 = ptrtoint ptr %t110 to i64
  %t112 = inttoptr i64 %t111 to ptr
  call void @intrinsic_println(ptr %t112)
  %t113 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.10)
  %t114 = ptrtoint ptr %t113 to i64
  %t115 = inttoptr i64 %t114 to ptr
  call void @intrinsic_println(ptr %t115)
  %t116 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.11)
  %t117 = ptrtoint ptr %t116 to i64
  %t118 = inttoptr i64 %t117 to ptr
  call void @intrinsic_println(ptr %t118)
  %t119 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.12)
  %t120 = ptrtoint ptr %t119 to i64
  %t121 = inttoptr i64 %t120 to ptr
  call void @intrinsic_println(ptr %t121)
  store i64 2, ptr %local.p_prev.53
  store i64 3, ptr %local.p_curr.54
  store i64 2, ptr %local.prime_idx.55
  store i64 0, ptr %local.gap_0.56
  store i64 0, ptr %local.gap_1.57
  store i64 0, ptr %local.gap_2.58
  store i64 0, ptr %local.gap_3.59
  store i64 0, ptr %local.gp_0.60
  store i64 0, ptr %local.gp_1.61
  store i64 0, ptr %local.gp_2.62
  store i64 0, ptr %local.gpp_0.63
  store i64 0, ptr %local.gpp_1.64
  store i64 0, ptr %local.gppp.65
  store i64 0, ptr %local.gap_count.66
  store i64 0, ptr %local.sum_g.67
  store i64 0, ptr %local.sum_gp.68
  store i64 0, ptr %local.sum_abs_gp.69
  store i64 0, ptr %local.sign_g.70
  store i64 0, ptr %local.sign_gp.71
  store i64 0, ptr %local.sign_gpp.72
  store i64 0, ptr %local.sign_gppp.73
  store i64 0, ptr %local.prev_sign_gp.74
  store i64 0, ptr %local.prev_sign_gpp.75
  store i64 0, ptr %local.prev_sign_gppp.76
  store i64 0, ptr %local.total_gaps.77
  store i64 0, ptr %local.total_gp.78
  store i64 0, ptr %local.total_gpp.79
  store i64 0, ptr %local.total_gppp.80
  store i64 2, ptr %local.p_curr.54
  store i64 0, ptr %local.p_next.81
  store i64 1, ptr %local.prime_idx.55
  br label %loop7
loop7:
  %t122 = load i64, ptr %local.prime_idx.55
  %t123 = icmp slt i64 %t122, 200
  %t124 = zext i1 %t123 to i64
  %t125 = icmp ne i64 %t124, 0
  br i1 %t125, label %body7, label %endloop7
body7:
  %t126 = load i64, ptr %local.p_curr.54
  %t127 = call i64 @"next_prime"(i64 %t126)
  store i64 %t127, ptr %local.p_next.81
  %t128 = load i64, ptr %local.p_next.81
  %t129 = load i64, ptr %local.p_curr.54
  %t130 = sub i64 %t128, %t129
  store i64 %t130, ptr %local.new_gap.82
  %t131 = load i64, ptr %local.gap_2.58
  store i64 %t131, ptr %local.gap_3.59
  %t132 = load i64, ptr %local.gap_1.57
  store i64 %t132, ptr %local.gap_2.58
  %t133 = load i64, ptr %local.gap_0.56
  store i64 %t133, ptr %local.gap_1.57
  %t134 = load i64, ptr %local.new_gap.82
  store i64 %t134, ptr %local.gap_0.56
  %t135 = load i64, ptr %local.total_gaps.77
  %t136 = add i64 %t135, 1
  store i64 %t136, ptr %local.total_gaps.77
  %t137 = load i64, ptr %local.sum_g.67
  %t138 = load i64, ptr %local.new_gap.82
  %t139 = add i64 %t137, %t138
  store i64 %t139, ptr %local.sum_g.67
  %t140 = load i64, ptr %local.total_gaps.77
  %t141 = icmp sge i64 %t140, 2
  %t142 = zext i1 %t141 to i64
  %t143 = icmp ne i64 %t142, 0
  br i1 %t143, label %then8, label %else8
then8:
  %t144 = load i64, ptr %local.gp_1.61
  store i64 %t144, ptr %local.gp_2.62
  %t145 = load i64, ptr %local.gp_0.60
  store i64 %t145, ptr %local.gp_1.61
  %t146 = load i64, ptr %local.gap_0.56
  %t147 = load i64, ptr %local.gap_1.57
  %t148 = sub i64 %t146, %t147
  store i64 %t148, ptr %local.gp_0.60
  %t149 = load i64, ptr %local.total_gp.78
  %t150 = add i64 %t149, 1
  store i64 %t150, ptr %local.total_gp.78
  %t151 = load i64, ptr %local.sum_gp.68
  %t152 = load i64, ptr %local.gp_0.60
  %t153 = add i64 %t151, %t152
  store i64 %t153, ptr %local.sum_gp.68
  %t154 = load i64, ptr %local.gp_0.60
  %t155 = icmp sge i64 %t154, 0
  %t156 = zext i1 %t155 to i64
  %t157 = icmp ne i64 %t156, 0
  br i1 %t157, label %then9, label %else9
then9:
  %t158 = load i64, ptr %local.sum_abs_gp.69
  %t159 = load i64, ptr %local.gp_0.60
  %t160 = add i64 %t158, %t159
  store i64 %t160, ptr %local.sum_abs_gp.69
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t161 = load i64, ptr %local.sum_abs_gp.69
  %t162 = load i64, ptr %local.gp_0.60
  %t163 = sub i64 %t161, %t162
  store i64 %t163, ptr %local.sum_abs_gp.69
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t164 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t165 = load i64, ptr %local.gp_0.60
  %t166 = icmp sge i64 %t165, 0
  %t167 = zext i1 %t166 to i64
  %t168 = icmp ne i64 %t167, 0
  br i1 %t168, label %then10, label %else10
then10:
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t169 = phi i64 [ 1, %then10_end ], [ 0, %else10_end ]
  store i64 %t169, ptr %local.cur_sign_gp.83
  %t170 = load i64, ptr %local.total_gp.78
  %t171 = icmp sgt i64 %t170, 1
  %t172 = zext i1 %t171 to i64
  %t173 = icmp ne i64 %t172, 0
  br i1 %t173, label %then11, label %else11
then11:
  %t174 = load i64, ptr %local.cur_sign_gp.83
  %t175 = load i64, ptr %local.prev_sign_gp.74
  %t176 = icmp ne i64 %t174, %t175
  %t177 = zext i1 %t176 to i64
  %t178 = icmp ne i64 %t177, 0
  br i1 %t178, label %then12, label %else12
then12:
  %t179 = load i64, ptr %local.sign_gp.71
  %t180 = add i64 %t179, 1
  store i64 %t180, ptr %local.sign_gp.71
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t181 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t182 = phi i64 [ %t181, %then11_end ], [ 0, %else11_end ]
  %t183 = load i64, ptr %local.cur_sign_gp.83
  store i64 %t183, ptr %local.prev_sign_gp.74
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t184 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t185 = load i64, ptr %local.total_gaps.77
  %t186 = icmp sge i64 %t185, 3
  %t187 = zext i1 %t186 to i64
  %t188 = icmp ne i64 %t187, 0
  br i1 %t188, label %then13, label %else13
then13:
  %t189 = load i64, ptr %local.gpp_0.63
  store i64 %t189, ptr %local.gpp_1.64
  %t190 = load i64, ptr %local.gp_0.60
  %t191 = load i64, ptr %local.gp_1.61
  %t192 = sub i64 %t190, %t191
  store i64 %t192, ptr %local.gpp_0.63
  %t193 = load i64, ptr %local.total_gpp.79
  %t194 = add i64 %t193, 1
  store i64 %t194, ptr %local.total_gpp.79
  %t195 = load i64, ptr %local.gpp_0.63
  %t196 = icmp sge i64 %t195, 0
  %t197 = zext i1 %t196 to i64
  %t198 = icmp ne i64 %t197, 0
  br i1 %t198, label %then14, label %else14
then14:
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t199 = phi i64 [ 1, %then14_end ], [ 0, %else14_end ]
  store i64 %t199, ptr %local.cur_sign_gpp.84
  %t200 = load i64, ptr %local.total_gpp.79
  %t201 = icmp sgt i64 %t200, 1
  %t202 = zext i1 %t201 to i64
  %t203 = icmp ne i64 %t202, 0
  br i1 %t203, label %then15, label %else15
then15:
  %t204 = load i64, ptr %local.cur_sign_gpp.84
  %t205 = load i64, ptr %local.prev_sign_gpp.75
  %t206 = icmp ne i64 %t204, %t205
  %t207 = zext i1 %t206 to i64
  %t208 = icmp ne i64 %t207, 0
  br i1 %t208, label %then16, label %else16
then16:
  %t209 = load i64, ptr %local.sign_gpp.72
  %t210 = add i64 %t209, 1
  store i64 %t210, ptr %local.sign_gpp.72
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t211 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t212 = phi i64 [ %t211, %then15_end ], [ 0, %else15_end ]
  %t213 = load i64, ptr %local.cur_sign_gpp.84
  store i64 %t213, ptr %local.prev_sign_gpp.75
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t214 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t215 = load i64, ptr %local.total_gaps.77
  %t216 = icmp sge i64 %t215, 4
  %t217 = zext i1 %t216 to i64
  %t218 = icmp ne i64 %t217, 0
  br i1 %t218, label %then17, label %else17
then17:
  %t219 = load i64, ptr %local.gpp_0.63
  %t220 = load i64, ptr %local.gpp_1.64
  %t221 = sub i64 %t219, %t220
  store i64 %t221, ptr %local.gppp.65
  %t222 = load i64, ptr %local.total_gppp.80
  %t223 = add i64 %t222, 1
  store i64 %t223, ptr %local.total_gppp.80
  %t224 = load i64, ptr %local.gppp.65
  %t225 = icmp sge i64 %t224, 0
  %t226 = zext i1 %t225 to i64
  %t227 = icmp ne i64 %t226, 0
  br i1 %t227, label %then18, label %else18
then18:
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t228 = phi i64 [ 1, %then18_end ], [ 0, %else18_end ]
  store i64 %t228, ptr %local.cur_sign_gppp.85
  %t229 = load i64, ptr %local.total_gppp.80
  %t230 = icmp sgt i64 %t229, 1
  %t231 = zext i1 %t230 to i64
  %t232 = icmp ne i64 %t231, 0
  br i1 %t232, label %then19, label %else19
then19:
  %t233 = load i64, ptr %local.cur_sign_gppp.85
  %t234 = load i64, ptr %local.prev_sign_gppp.76
  %t235 = icmp ne i64 %t233, %t234
  %t236 = zext i1 %t235 to i64
  %t237 = icmp ne i64 %t236, 0
  br i1 %t237, label %then20, label %else20
then20:
  %t238 = load i64, ptr %local.sign_gppp.73
  %t239 = add i64 %t238, 1
  store i64 %t239, ptr %local.sign_gppp.73
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t240 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t241 = phi i64 [ %t240, %then19_end ], [ 0, %else19_end ]
  %t242 = load i64, ptr %local.cur_sign_gppp.85
  store i64 %t242, ptr %local.prev_sign_gppp.76
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t243 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t244 = load i64, ptr %local.total_gaps.77
  %t245 = icmp sge i64 %t244, 4
  %t246 = zext i1 %t245 to i64
  %t247 = icmp ne i64 %t246, 0
  br i1 %t247, label %then21, label %else21
then21:
  %t248 = load i64, ptr %local.total_gaps.77
  %t249 = icmp sle i64 %t248, 33
  %t250 = zext i1 %t249 to i64
  %t251 = icmp ne i64 %t250, 0
  br i1 %t251, label %then22, label %else22
then22:
  %t252 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.13)
  %t253 = ptrtoint ptr %t252 to i64
  %t254 = inttoptr i64 %t253 to ptr
  call void @intrinsic_print(ptr %t254)
  %t255 = load i64, ptr %local.total_gaps.77
  %t256 = sub i64 %t255, 3
  call void @print_i64(i64 %t256)
  %t257 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.14)
  %t258 = ptrtoint ptr %t257 to i64
  %t259 = inttoptr i64 %t258 to ptr
  call void @intrinsic_print(ptr %t259)
  %t260 = load i64, ptr %local.gap_3.59
  call void @print_i64(i64 %t260)
  %t261 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.15)
  %t262 = ptrtoint ptr %t261 to i64
  %t263 = inttoptr i64 %t262 to ptr
  call void @intrinsic_print(ptr %t263)
  %t264 = load i64, ptr %local.gp_1.61
  call void @print_i64(i64 %t264)
  %t265 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.16)
  %t266 = ptrtoint ptr %t265 to i64
  %t267 = inttoptr i64 %t266 to ptr
  call void @intrinsic_print(ptr %t267)
  %t268 = load i64, ptr %local.gpp_1.64
  call void @print_i64(i64 %t268)
  %t269 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.17)
  %t270 = ptrtoint ptr %t269 to i64
  %t271 = inttoptr i64 %t270 to ptr
  call void @intrinsic_print(ptr %t271)
  %t272 = load i64, ptr %local.gppp.65
  call void @print_i64(i64 %t272)
  %t273 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.18)
  %t274 = ptrtoint ptr %t273 to i64
  %t275 = inttoptr i64 %t274 to ptr
  call void @intrinsic_println(ptr %t275)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t276 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t277 = phi i64 [ %t276, %then21_end ], [ 0, %else21_end ]
  %t278 = load i64, ptr %local.p_next.81
  store i64 %t278, ptr %local.p_curr.54
  %t279 = load i64, ptr %local.prime_idx.55
  %t280 = add i64 %t279, 1
  store i64 %t280, ptr %local.prime_idx.55
  br label %loop7
endloop7:
  %t281 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.19)
  %t282 = ptrtoint ptr %t281 to i64
  %t283 = inttoptr i64 %t282 to ptr
  call void @intrinsic_println(ptr %t283)
  %t284 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.20)
  %t285 = ptrtoint ptr %t284 to i64
  %t286 = inttoptr i64 %t285 to ptr
  call void @intrinsic_println(ptr %t286)
  %t287 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.21)
  %t288 = ptrtoint ptr %t287 to i64
  %t289 = inttoptr i64 %t288 to ptr
  call void @intrinsic_println(ptr %t289)
  %t290 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.22)
  %t291 = ptrtoint ptr %t290 to i64
  %t292 = inttoptr i64 %t291 to ptr
  call void @intrinsic_print(ptr %t292)
  %t293 = load i64, ptr %local.sum_g.67
  %t294 = call i64 @"sx_int_to_f64"(i64 %t293)
  %t295 = load i64, ptr %local.total_gaps.77
  %t296 = call i64 @"sx_int_to_f64"(i64 %t295)
  %t297 = call i64 @"sx_f64_div"(i64 %t294, i64 %t296)
  %t298 = call i64 @"print_f64"(i64 %t297)
  %t299 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.23)
  %t300 = ptrtoint ptr %t299 to i64
  %t301 = inttoptr i64 %t300 to ptr
  call void @intrinsic_println(ptr %t301)
  %t302 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.24)
  %t303 = ptrtoint ptr %t302 to i64
  %t304 = inttoptr i64 %t303 to ptr
  call void @intrinsic_print(ptr %t304)
  %t305 = load i64, ptr %local.sum_gp.68
  %t306 = call i64 @"sx_int_to_f64"(i64 %t305)
  %t307 = load i64, ptr %local.total_gp.78
  %t308 = call i64 @"sx_int_to_f64"(i64 %t307)
  %t309 = call i64 @"sx_f64_div"(i64 %t306, i64 %t308)
  %t310 = call i64 @"print_f64"(i64 %t309)
  %t311 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.25)
  %t312 = ptrtoint ptr %t311 to i64
  %t313 = inttoptr i64 %t312 to ptr
  call void @intrinsic_println(ptr %t313)
  %t314 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.26)
  %t315 = ptrtoint ptr %t314 to i64
  %t316 = inttoptr i64 %t315 to ptr
  call void @intrinsic_print(ptr %t316)
  %t317 = load i64, ptr %local.sum_abs_gp.69
  %t318 = call i64 @"sx_int_to_f64"(i64 %t317)
  %t319 = load i64, ptr %local.total_gp.78
  %t320 = call i64 @"sx_int_to_f64"(i64 %t319)
  %t321 = call i64 @"sx_f64_div"(i64 %t318, i64 %t320)
  %t322 = call i64 @"print_f64"(i64 %t321)
  %t323 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.27)
  %t324 = ptrtoint ptr %t323 to i64
  %t325 = inttoptr i64 %t324 to ptr
  call void @intrinsic_println(ptr %t325)
  %t326 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.28)
  %t327 = ptrtoint ptr %t326 to i64
  %t328 = inttoptr i64 %t327 to ptr
  call void @intrinsic_println(ptr %t328)
  %t329 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.29)
  %t330 = ptrtoint ptr %t329 to i64
  %t331 = inttoptr i64 %t330 to ptr
  call void @intrinsic_print(ptr %t331)
  %t332 = load i64, ptr %local.sign_gp.71
  call void @print_i64(i64 %t332)
  %t333 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.30)
  %t334 = ptrtoint ptr %t333 to i64
  %t335 = inttoptr i64 %t334 to ptr
  call void @intrinsic_print(ptr %t335)
  %t336 = load i64, ptr %local.total_gp.78
  call void @print_i64(i64 %t336)
  %t337 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.31)
  %t338 = ptrtoint ptr %t337 to i64
  %t339 = inttoptr i64 %t338 to ptr
  call void @intrinsic_println(ptr %t339)
  %t340 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.32)
  %t341 = ptrtoint ptr %t340 to i64
  %t342 = inttoptr i64 %t341 to ptr
  call void @intrinsic_print(ptr %t342)
  %t343 = load i64, ptr %local.sign_gpp.72
  call void @print_i64(i64 %t343)
  %t344 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.33)
  %t345 = ptrtoint ptr %t344 to i64
  %t346 = inttoptr i64 %t345 to ptr
  call void @intrinsic_print(ptr %t346)
  %t347 = load i64, ptr %local.total_gpp.79
  call void @print_i64(i64 %t347)
  %t348 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.34)
  %t349 = ptrtoint ptr %t348 to i64
  %t350 = inttoptr i64 %t349 to ptr
  call void @intrinsic_println(ptr %t350)
  %t351 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.35)
  %t352 = ptrtoint ptr %t351 to i64
  %t353 = inttoptr i64 %t352 to ptr
  call void @intrinsic_print(ptr %t353)
  %t354 = load i64, ptr %local.sign_gppp.73
  call void @print_i64(i64 %t354)
  %t355 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.36)
  %t356 = ptrtoint ptr %t355 to i64
  %t357 = inttoptr i64 %t356 to ptr
  call void @intrinsic_print(ptr %t357)
  %t358 = load i64, ptr %local.total_gppp.80
  call void @print_i64(i64 %t358)
  %t359 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.37)
  %t360 = ptrtoint ptr %t359 to i64
  %t361 = inttoptr i64 %t360 to ptr
  call void @intrinsic_println(ptr %t361)
  %t362 = load i64, ptr %local.total_gp.78
  %t363 = icmp sgt i64 %t362, 0
  %t364 = zext i1 %t363 to i64
  %t365 = icmp ne i64 %t364, 0
  br i1 %t365, label %then23, label %else23
then23:
  %t366 = load i64, ptr %local.sign_gp.71
  %t367 = call i64 @"sx_int_to_f64"(i64 %t366)
  %t368 = load i64, ptr %local.total_gp.78
  %t369 = call i64 @"sx_int_to_f64"(i64 %t368)
  %t370 = call i64 @"sx_f64_div"(i64 %t367, i64 %t369)
  store i64 %t370, ptr %local.ratio_gp.86
  %t371 = load i64, ptr %local.sign_gpp.72
  %t372 = call i64 @"sx_int_to_f64"(i64 %t371)
  %t373 = load i64, ptr %local.total_gpp.79
  %t374 = call i64 @"sx_int_to_f64"(i64 %t373)
  %t375 = call i64 @"sx_f64_div"(i64 %t372, i64 %t374)
  store i64 %t375, ptr %local.ratio_gpp.87
  %t376 = load i64, ptr %local.sign_gppp.73
  %t377 = call i64 @"sx_int_to_f64"(i64 %t376)
  %t378 = load i64, ptr %local.total_gppp.80
  %t379 = call i64 @"sx_int_to_f64"(i64 %t378)
  %t380 = call i64 @"sx_f64_div"(i64 %t377, i64 %t379)
  store i64 %t380, ptr %local.ratio_gppp.88
  %t381 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.38)
  %t382 = ptrtoint ptr %t381 to i64
  %t383 = inttoptr i64 %t382 to ptr
  call void @intrinsic_println(ptr %t383)
  %t384 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.39)
  %t385 = ptrtoint ptr %t384 to i64
  %t386 = inttoptr i64 %t385 to ptr
  call void @intrinsic_print(ptr %t386)
  %t387 = load i64, ptr %local.ratio_gp.86
  %t388 = call i64 @"print_f64"(i64 %t387)
  %t389 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.40)
  %t390 = ptrtoint ptr %t389 to i64
  %t391 = inttoptr i64 %t390 to ptr
  call void @intrinsic_println(ptr %t391)
  %t392 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.41)
  %t393 = ptrtoint ptr %t392 to i64
  %t394 = inttoptr i64 %t393 to ptr
  call void @intrinsic_print(ptr %t394)
  %t395 = load i64, ptr %local.ratio_gpp.87
  %t396 = call i64 @"print_f64"(i64 %t395)
  %t397 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.42)
  %t398 = ptrtoint ptr %t397 to i64
  %t399 = inttoptr i64 %t398 to ptr
  call void @intrinsic_println(ptr %t399)
  %t400 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.43)
  %t401 = ptrtoint ptr %t400 to i64
  %t402 = inttoptr i64 %t401 to ptr
  call void @intrinsic_print(ptr %t402)
  %t403 = load i64, ptr %local.ratio_gppp.88
  %t404 = call i64 @"print_f64"(i64 %t403)
  %t405 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.44)
  %t406 = ptrtoint ptr %t405 to i64
  %t407 = inttoptr i64 %t406 to ptr
  call void @intrinsic_println(ptr %t407)
  %t408 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.45)
  %t409 = ptrtoint ptr %t408 to i64
  %t410 = inttoptr i64 %t409 to ptr
  call void @intrinsic_println(ptr %t410)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t411 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t412 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.46)
  %t413 = ptrtoint ptr %t412 to i64
  %t414 = inttoptr i64 %t413 to ptr
  call void @intrinsic_println(ptr %t414)
  %t415 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.47)
  %t416 = ptrtoint ptr %t415 to i64
  %t417 = inttoptr i64 %t416 to ptr
  call void @intrinsic_println(ptr %t417)
  %t418 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.48)
  %t419 = ptrtoint ptr %t418 to i64
  %t420 = inttoptr i64 %t419 to ptr
  call void @intrinsic_println(ptr %t420)
  %t421 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.49)
  %t422 = ptrtoint ptr %t421 to i64
  %t423 = inttoptr i64 %t422 to ptr
  call void @intrinsic_println(ptr %t423)
  %t424 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.50)
  %t425 = ptrtoint ptr %t424 to i64
  %t426 = inttoptr i64 %t425 to ptr
  call void @intrinsic_println(ptr %t426)
  %t427 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.51)
  %t428 = ptrtoint ptr %t427 to i64
  %t429 = inttoptr i64 %t428 to ptr
  call void @intrinsic_println(ptr %t429)
  %t430 = call i64 @"exp2_running_avg"()
  %t431 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.52)
  %t432 = ptrtoint ptr %t431 to i64
  %t433 = inttoptr i64 %t432 to ptr
  call void @intrinsic_println(ptr %t433)
  %t434 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.53)
  %t435 = ptrtoint ptr %t434 to i64
  %t436 = inttoptr i64 %t435 to ptr
  call void @intrinsic_println(ptr %t436)
  %t437 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.54)
  %t438 = ptrtoint ptr %t437 to i64
  %t439 = inttoptr i64 %t438 to ptr
  call void @intrinsic_println(ptr %t439)
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.55)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_println(ptr %t442)
  %t443 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.56)
  %t444 = ptrtoint ptr %t443 to i64
  %t445 = inttoptr i64 %t444 to ptr
  call void @intrinsic_println(ptr %t445)
  %t446 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.57)
  %t447 = ptrtoint ptr %t446 to i64
  %t448 = inttoptr i64 %t447 to ptr
  call void @intrinsic_println(ptr %t448)
  %t449 = call i64 @"exp3_autocorrelation"()
  %t450 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.58)
  %t451 = ptrtoint ptr %t450 to i64
  %t452 = inttoptr i64 %t451 to ptr
  call void @intrinsic_println(ptr %t452)
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.59)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_println(ptr %t455)
  %t456 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.60)
  %t457 = ptrtoint ptr %t456 to i64
  %t458 = inttoptr i64 %t457 to ptr
  call void @intrinsic_println(ptr %t458)
  %t459 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.61)
  %t460 = ptrtoint ptr %t459 to i64
  %t461 = inttoptr i64 %t460 to ptr
  call void @intrinsic_println(ptr %t461)
  %t462 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.62)
  %t463 = ptrtoint ptr %t462 to i64
  %t464 = inttoptr i64 %t463 to ptr
  call void @intrinsic_println(ptr %t464)
  %t465 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.63)
  %t466 = ptrtoint ptr %t465 to i64
  %t467 = inttoptr i64 %t466 to ptr
  call void @intrinsic_println(ptr %t467)
  %t468 = call i64 @"exp4_twin_prime"()
  %t469 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.64)
  %t470 = ptrtoint ptr %t469 to i64
  %t471 = inttoptr i64 %t470 to ptr
  call void @intrinsic_println(ptr %t471)
  %t472 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.65)
  %t473 = ptrtoint ptr %t472 to i64
  %t474 = inttoptr i64 %t473 to ptr
  call void @intrinsic_println(ptr %t474)
  %t475 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.66)
  %t476 = ptrtoint ptr %t475 to i64
  %t477 = inttoptr i64 %t476 to ptr
  call void @intrinsic_println(ptr %t477)
  %t478 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.67)
  %t479 = ptrtoint ptr %t478 to i64
  %t480 = inttoptr i64 %t479 to ptr
  call void @intrinsic_println(ptr %t480)
  %t481 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.68)
  %t482 = ptrtoint ptr %t481 to i64
  %t483 = inttoptr i64 %t482 to ptr
  call void @intrinsic_println(ptr %t483)
  ret i64 0
}

define i64 @"exp2_running_avg"() nounwind {
entry:
  %local.p_cur.484 = alloca i64
  %local.p_nxt.485 = alloca i64
  %local.idx.486 = alloca i64
  %local.gap.487 = alloca i64
  %local.sum10.488 = alloca i64
  %local.sum20.489 = alloca i64
  %local.sum50.490 = alloca i64
  %local.count10.491 = alloca i64
  %local.count20.492 = alloca i64
  %local.count50.493 = alloca i64
  %local.window_gaps_sum.494 = alloca i64
  %local.window_count.495 = alloca i64
  %local.prev_avg10.496 = alloca i64
  %local.prev_avg20.497 = alloca i64
  %local.prev_avg50.498 = alloca i64
  %local.acc10.499 = alloca i64
  %local.n10.500 = alloca i64
  %local.acc20.501 = alloca i64
  %local.n20.502 = alloca i64
  %local.acc50.503 = alloca i64
  %local.n50.504 = alloca i64
  %t505 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.69)
  %t506 = ptrtoint ptr %t505 to i64
  %t507 = inttoptr i64 %t506 to ptr
  call void @intrinsic_println(ptr %t507)
  store i64 2, ptr %local.p_cur.484
  store i64 0, ptr %local.p_nxt.485
  store i64 1, ptr %local.idx.486
  store i64 0, ptr %local.gap.487
  store i64 0, ptr %local.sum10.488
  store i64 0, ptr %local.sum20.489
  store i64 0, ptr %local.sum50.490
  store i64 0, ptr %local.count10.491
  store i64 0, ptr %local.count20.492
  store i64 0, ptr %local.count50.493
  store i64 0, ptr %local.window_gaps_sum.494
  store i64 0, ptr %local.window_count.495
  %t508 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.70)
  store i64 %t508, ptr %local.prev_avg10.496
  %t509 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.71)
  store i64 %t509, ptr %local.prev_avg20.497
  %t510 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.72)
  store i64 %t510, ptr %local.prev_avg50.498
  store i64 0, ptr %local.acc10.499
  store i64 0, ptr %local.n10.500
  store i64 0, ptr %local.acc20.501
  store i64 0, ptr %local.n20.502
  store i64 0, ptr %local.acc50.503
  store i64 0, ptr %local.n50.504
  br label %loop24
loop24:
  %t511 = load i64, ptr %local.idx.486
  %t512 = icmp slt i64 %t511, 200
  %t513 = zext i1 %t512 to i64
  %t514 = icmp ne i64 %t513, 0
  br i1 %t514, label %body24, label %endloop24
body24:
  %t515 = load i64, ptr %local.p_cur.484
  %t516 = call i64 @"next_prime"(i64 %t515)
  store i64 %t516, ptr %local.p_nxt.485
  %t517 = load i64, ptr %local.p_nxt.485
  %t518 = load i64, ptr %local.p_cur.484
  %t519 = sub i64 %t517, %t518
  store i64 %t519, ptr %local.gap.487
  %t520 = load i64, ptr %local.acc10.499
  %t521 = load i64, ptr %local.gap.487
  %t522 = add i64 %t520, %t521
  store i64 %t522, ptr %local.acc10.499
  %t523 = load i64, ptr %local.n10.500
  %t524 = add i64 %t523, 1
  store i64 %t524, ptr %local.n10.500
  %t525 = load i64, ptr %local.n10.500
  %t526 = icmp sge i64 %t525, 10
  %t527 = zext i1 %t526 to i64
  %t528 = icmp ne i64 %t527, 0
  br i1 %t528, label %then25, label %else25
then25:
  store i64 0, ptr %local.n10.500
  %t529 = load i64, ptr %local.acc10.499
  store i64 %t529, ptr %local.sum10.488
  store i64 0, ptr %local.acc10.499
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t530 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t531 = load i64, ptr %local.acc20.501
  %t532 = load i64, ptr %local.gap.487
  %t533 = add i64 %t531, %t532
  store i64 %t533, ptr %local.acc20.501
  %t534 = load i64, ptr %local.n20.502
  %t535 = add i64 %t534, 1
  store i64 %t535, ptr %local.n20.502
  %t536 = load i64, ptr %local.n20.502
  %t537 = icmp sge i64 %t536, 20
  %t538 = zext i1 %t537 to i64
  %t539 = icmp ne i64 %t538, 0
  br i1 %t539, label %then26, label %else26
then26:
  store i64 0, ptr %local.n20.502
  %t540 = load i64, ptr %local.acc20.501
  store i64 %t540, ptr %local.sum20.489
  store i64 0, ptr %local.acc20.501
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t541 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t542 = load i64, ptr %local.acc50.503
  %t543 = load i64, ptr %local.gap.487
  %t544 = add i64 %t542, %t543
  store i64 %t544, ptr %local.acc50.503
  %t545 = load i64, ptr %local.n50.504
  %t546 = add i64 %t545, 1
  store i64 %t546, ptr %local.n50.504
  %t547 = load i64, ptr %local.n50.504
  %t548 = icmp sge i64 %t547, 50
  %t549 = zext i1 %t548 to i64
  %t550 = icmp ne i64 %t549, 0
  br i1 %t550, label %then27, label %else27
then27:
  store i64 0, ptr %local.n50.504
  %t551 = load i64, ptr %local.acc50.503
  store i64 %t551, ptr %local.sum50.490
  store i64 0, ptr %local.acc50.503
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t552 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t553 = load i64, ptr %local.idx.486
  %t554 = icmp eq i64 %t553, 50
  %t555 = zext i1 %t554 to i64
  %t556 = icmp ne i64 %t555, 0
  br i1 %t556, label %then28, label %else28
then28:
  %t557 = load i64, ptr %local.sum10.488
  %t558 = load i64, ptr %local.sum20.489
  %t559 = load i64, ptr %local.sum50.490
  %t560 = load i64, ptr %local.p_cur.484
  %t561 = call i64 @"print_running_row"(i64 50, i64 %t557, i64 10, i64 %t558, i64 20, i64 %t559, i64 50, i64 %t560)
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t562 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t563 = load i64, ptr %local.idx.486
  %t564 = icmp eq i64 %t563, 100
  %t565 = zext i1 %t564 to i64
  %t566 = icmp ne i64 %t565, 0
  br i1 %t566, label %then29, label %else29
then29:
  %t567 = load i64, ptr %local.sum10.488
  %t568 = load i64, ptr %local.sum20.489
  %t569 = load i64, ptr %local.sum50.490
  %t570 = load i64, ptr %local.p_cur.484
  %t571 = call i64 @"print_running_row"(i64 100, i64 %t567, i64 10, i64 %t568, i64 20, i64 %t569, i64 50, i64 %t570)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t572 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t573 = load i64, ptr %local.idx.486
  %t574 = icmp eq i64 %t573, 150
  %t575 = zext i1 %t574 to i64
  %t576 = icmp ne i64 %t575, 0
  br i1 %t576, label %then30, label %else30
then30:
  %t577 = load i64, ptr %local.sum10.488
  %t578 = load i64, ptr %local.sum20.489
  %t579 = load i64, ptr %local.sum50.490
  %t580 = load i64, ptr %local.p_cur.484
  %t581 = call i64 @"print_running_row"(i64 150, i64 %t577, i64 10, i64 %t578, i64 20, i64 %t579, i64 50, i64 %t580)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t582 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t583 = load i64, ptr %local.idx.486
  %t584 = icmp eq i64 %t583, 199
  %t585 = zext i1 %t584 to i64
  %t586 = icmp ne i64 %t585, 0
  br i1 %t586, label %then31, label %else31
then31:
  %t587 = load i64, ptr %local.sum10.488
  %t588 = load i64, ptr %local.sum20.489
  %t589 = load i64, ptr %local.sum50.490
  %t590 = load i64, ptr %local.p_cur.484
  %t591 = call i64 @"print_running_row"(i64 199, i64 %t587, i64 10, i64 %t588, i64 20, i64 %t589, i64 50, i64 %t590)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t592 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t593 = load i64, ptr %local.p_nxt.485
  store i64 %t593, ptr %local.p_cur.484
  %t594 = load i64, ptr %local.idx.486
  %t595 = add i64 %t594, 1
  store i64 %t595, ptr %local.idx.486
  br label %loop24
endloop24:
  %t596 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.73)
  %t597 = ptrtoint ptr %t596 to i64
  %t598 = inttoptr i64 %t597 to ptr
  call void @intrinsic_println(ptr %t598)
  %t599 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.74)
  %t600 = ptrtoint ptr %t599 to i64
  %t601 = inttoptr i64 %t600 to ptr
  call void @intrinsic_println(ptr %t601)
  %t602 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.75)
  %t603 = ptrtoint ptr %t602 to i64
  %t604 = inttoptr i64 %t603 to ptr
  call void @intrinsic_println(ptr %t604)
  ret i64 0
}

define i64 @"print_running_row"(i64 %checkpoint, i64 %s10, i64 %w10, i64 %s20, i64 %w20, i64 %s50, i64 %w50, i64 %p) nounwind {
entry:
  %local.avg10.605 = alloca i64
  %local.avg20.606 = alloca i64
  %local.avg50.607 = alloca i64
  %local.ln_p.608 = alloca i64
  %local.checkpoint = alloca i64
  store i64 %checkpoint, ptr %local.checkpoint
  %local.s10 = alloca i64
  store i64 %s10, ptr %local.s10
  %local.w10 = alloca i64
  store i64 %w10, ptr %local.w10
  %local.s20 = alloca i64
  store i64 %s20, ptr %local.s20
  %local.w20 = alloca i64
  store i64 %w20, ptr %local.w20
  %local.s50 = alloca i64
  store i64 %s50, ptr %local.s50
  %local.w50 = alloca i64
  store i64 %w50, ptr %local.w50
  %local.p = alloca i64
  store i64 %p, ptr %local.p
  %t609 = load i64, ptr %local.s10
  %t610 = call i64 @"sx_int_to_f64"(i64 %t609)
  %t611 = load i64, ptr %local.w10
  %t612 = call i64 @"sx_int_to_f64"(i64 %t611)
  %t613 = call i64 @"sx_f64_div"(i64 %t610, i64 %t612)
  store i64 %t613, ptr %local.avg10.605
  %t614 = load i64, ptr %local.s20
  %t615 = call i64 @"sx_int_to_f64"(i64 %t614)
  %t616 = load i64, ptr %local.w20
  %t617 = call i64 @"sx_int_to_f64"(i64 %t616)
  %t618 = call i64 @"sx_f64_div"(i64 %t615, i64 %t617)
  store i64 %t618, ptr %local.avg20.606
  %t619 = load i64, ptr %local.s50
  %t620 = call i64 @"sx_int_to_f64"(i64 %t619)
  %t621 = load i64, ptr %local.w50
  %t622 = call i64 @"sx_int_to_f64"(i64 %t621)
  %t623 = call i64 @"sx_f64_div"(i64 %t620, i64 %t622)
  store i64 %t623, ptr %local.avg50.607
  %t624 = load i64, ptr %local.p
  %t625 = call i64 @"sx_int_to_f64"(i64 %t624)
  %t626 = call i64 @"ln_f64"(i64 %t625)
  store i64 %t626, ptr %local.ln_p.608
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.76)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_print(ptr %t629)
  %t630 = load i64, ptr %local.checkpoint
  call void @print_i64(i64 %t630)
  %t631 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.77)
  %t632 = ptrtoint ptr %t631 to i64
  %t633 = inttoptr i64 %t632 to ptr
  call void @intrinsic_print(ptr %t633)
  %t634 = load i64, ptr %local.p
  call void @print_i64(i64 %t634)
  %t635 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.78)
  %t636 = ptrtoint ptr %t635 to i64
  %t637 = inttoptr i64 %t636 to ptr
  call void @intrinsic_print(ptr %t637)
  %t638 = load i64, ptr %local.avg10.605
  %t639 = call i64 @"print_f64"(i64 %t638)
  %t640 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.79)
  %t641 = ptrtoint ptr %t640 to i64
  %t642 = inttoptr i64 %t641 to ptr
  call void @intrinsic_print(ptr %t642)
  %t643 = load i64, ptr %local.avg20.606
  %t644 = call i64 @"print_f64"(i64 %t643)
  %t645 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.80)
  %t646 = ptrtoint ptr %t645 to i64
  %t647 = inttoptr i64 %t646 to ptr
  call void @intrinsic_print(ptr %t647)
  %t648 = load i64, ptr %local.avg50.607
  %t649 = call i64 @"print_f64"(i64 %t648)
  %t650 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.81)
  %t651 = ptrtoint ptr %t650 to i64
  %t652 = inttoptr i64 %t651 to ptr
  call void @intrinsic_print(ptr %t652)
  %t653 = load i64, ptr %local.ln_p.608
  %t654 = call i64 @"print_f64"(i64 %t653)
  %t655 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.82)
  %t656 = ptrtoint ptr %t655 to i64
  %t657 = inttoptr i64 %t656 to ptr
  call void @intrinsic_println(ptr %t657)
  ret i64 0
}

define i64 @"exp3_autocorrelation"() nounwind {
entry:
  %local.p_cur.658 = alloca i64
  %local.p_nxt.659 = alloca i64
  %local.idx.660 = alloca i64
  %local.sum_gap.661 = alloca i64
  %local.total.662 = alloca i64
  %local.mean_gap.663 = alloca i64
  %local.var_sum.664 = alloca i64
  %local.g.665 = alloca i64
  %local.var_gap.666 = alloca i64
  store i64 2, ptr %local.p_cur.658
  store i64 0, ptr %local.p_nxt.659
  store i64 1, ptr %local.idx.660
  store i64 0, ptr %local.sum_gap.661
  store i64 0, ptr %local.total.662
  br label %loop32
loop32:
  %t667 = load i64, ptr %local.idx.660
  %t668 = icmp slt i64 %t667, 200
  %t669 = zext i1 %t668 to i64
  %t670 = icmp ne i64 %t669, 0
  br i1 %t670, label %body32, label %endloop32
body32:
  %t671 = load i64, ptr %local.p_cur.658
  %t672 = call i64 @"next_prime"(i64 %t671)
  store i64 %t672, ptr %local.p_nxt.659
  %t673 = load i64, ptr %local.sum_gap.661
  %t674 = load i64, ptr %local.p_nxt.659
  %t675 = load i64, ptr %local.p_cur.658
  %t676 = sub i64 %t674, %t675
  %t677 = add i64 %t673, %t676
  store i64 %t677, ptr %local.sum_gap.661
  %t678 = load i64, ptr %local.total.662
  %t679 = add i64 %t678, 1
  store i64 %t679, ptr %local.total.662
  %t680 = load i64, ptr %local.p_nxt.659
  store i64 %t680, ptr %local.p_cur.658
  %t681 = load i64, ptr %local.idx.660
  %t682 = add i64 %t681, 1
  store i64 %t682, ptr %local.idx.660
  br label %loop32
endloop32:
  %t683 = load i64, ptr %local.sum_gap.661
  %t684 = call i64 @"sx_int_to_f64"(i64 %t683)
  %t685 = load i64, ptr %local.total.662
  %t686 = call i64 @"sx_int_to_f64"(i64 %t685)
  %t687 = call i64 @"sx_f64_div"(i64 %t684, i64 %t686)
  store i64 %t687, ptr %local.mean_gap.663
  %t688 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.83)
  %t689 = ptrtoint ptr %t688 to i64
  %t690 = inttoptr i64 %t689 to ptr
  call void @intrinsic_print(ptr %t690)
  %t691 = load i64, ptr %local.mean_gap.663
  %t692 = call i64 @"print_f64"(i64 %t691)
  %t693 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.84)
  %t694 = ptrtoint ptr %t693 to i64
  %t695 = inttoptr i64 %t694 to ptr
  call void @intrinsic_println(ptr %t695)
  store i64 2, ptr %local.p_cur.658
  store i64 1, ptr %local.idx.660
  %t696 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.85)
  store i64 %t696, ptr %local.var_sum.664
  br label %loop33
loop33:
  %t697 = load i64, ptr %local.idx.660
  %t698 = icmp slt i64 %t697, 200
  %t699 = zext i1 %t698 to i64
  %t700 = icmp ne i64 %t699, 0
  br i1 %t700, label %body33, label %endloop33
body33:
  %t701 = load i64, ptr %local.p_cur.658
  %t702 = call i64 @"next_prime"(i64 %t701)
  store i64 %t702, ptr %local.p_nxt.659
  %t703 = load i64, ptr %local.p_nxt.659
  %t704 = load i64, ptr %local.p_cur.658
  %t705 = sub i64 %t703, %t704
  %t706 = call i64 @"sx_int_to_f64"(i64 %t705)
  %t707 = load i64, ptr %local.mean_gap.663
  %t708 = call i64 @"sx_f64_sub"(i64 %t706, i64 %t707)
  store i64 %t708, ptr %local.g.665
  %t709 = load i64, ptr %local.var_sum.664
  %t710 = load i64, ptr %local.g.665
  %t711 = load i64, ptr %local.g.665
  %t712 = call i64 @"sx_f64_mul"(i64 %t710, i64 %t711)
  %t713 = call i64 @"sx_f64_add"(i64 %t709, i64 %t712)
  store i64 %t713, ptr %local.var_sum.664
  %t714 = load i64, ptr %local.p_nxt.659
  store i64 %t714, ptr %local.p_cur.658
  %t715 = load i64, ptr %local.idx.660
  %t716 = add i64 %t715, 1
  store i64 %t716, ptr %local.idx.660
  br label %loop33
endloop33:
  %t717 = load i64, ptr %local.var_sum.664
  %t718 = load i64, ptr %local.total.662
  %t719 = call i64 @"sx_int_to_f64"(i64 %t718)
  %t720 = call i64 @"sx_f64_div"(i64 %t717, i64 %t719)
  store i64 %t720, ptr %local.var_gap.666
  %t721 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.86)
  %t722 = ptrtoint ptr %t721 to i64
  %t723 = inttoptr i64 %t722 to ptr
  call void @intrinsic_print(ptr %t723)
  %t724 = load i64, ptr %local.var_gap.666
  %t725 = call i64 @"print_f64"(i64 %t724)
  %t726 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.87)
  %t727 = ptrtoint ptr %t726 to i64
  %t728 = inttoptr i64 %t727 to ptr
  call void @intrinsic_println(ptr %t728)
  %t729 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.88)
  %t730 = ptrtoint ptr %t729 to i64
  %t731 = inttoptr i64 %t730 to ptr
  call void @intrinsic_println(ptr %t731)
  %t732 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.89)
  %t733 = ptrtoint ptr %t732 to i64
  %t734 = inttoptr i64 %t733 to ptr
  call void @intrinsic_println(ptr %t734)
  %t735 = load i64, ptr %local.mean_gap.663
  %t736 = load i64, ptr %local.var_gap.666
  %t737 = call i64 @"autocorr_at_lag"(i64 1, i64 %t735, i64 %t736)
  %t738 = load i64, ptr %local.mean_gap.663
  %t739 = load i64, ptr %local.var_gap.666
  %t740 = call i64 @"autocorr_at_lag"(i64 2, i64 %t738, i64 %t739)
  %t741 = load i64, ptr %local.mean_gap.663
  %t742 = load i64, ptr %local.var_gap.666
  %t743 = call i64 @"autocorr_at_lag"(i64 3, i64 %t741, i64 %t742)
  %t744 = load i64, ptr %local.mean_gap.663
  %t745 = load i64, ptr %local.var_gap.666
  %t746 = call i64 @"autocorr_at_lag"(i64 5, i64 %t744, i64 %t745)
  %t747 = load i64, ptr %local.mean_gap.663
  %t748 = load i64, ptr %local.var_gap.666
  %t749 = call i64 @"autocorr_at_lag"(i64 10, i64 %t747, i64 %t748)
  ret i64 0
}

define i64 @"autocorr_at_lag"(i64 %lag, i64 %mean_gap, i64 %var_gap) nounwind {
entry:
  %local.p_cur.750 = alloca i64
  %local.p_nxt.751 = alloca i64
  %local.idx.752 = alloca i64
  %local.sum_corr.753 = alloca i64
  %local.count.754 = alloca i64
  %local.p_lead.755 = alloca i64
  %local.p_lead_nxt.756 = alloca i64
  %local.lead_idx.757 = alloca i64
  %local.skip.758 = alloca i64
  %local.g_i.759 = alloca i64
  %local.g_ik.760 = alloca i64
  %local.r_k.761 = alloca i64
  %local.lag = alloca i64
  store i64 %lag, ptr %local.lag
  %local.mean_gap = alloca i64
  store i64 %mean_gap, ptr %local.mean_gap
  %local.var_gap = alloca i64
  store i64 %var_gap, ptr %local.var_gap
  store i64 2, ptr %local.p_cur.750
  store i64 0, ptr %local.p_nxt.751
  store i64 1, ptr %local.idx.752
  %t762 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.90)
  store i64 %t762, ptr %local.sum_corr.753
  store i64 0, ptr %local.count.754
  store i64 2, ptr %local.p_lead.755
  store i64 0, ptr %local.p_lead_nxt.756
  store i64 1, ptr %local.lead_idx.757
  store i64 0, ptr %local.skip.758
  br label %loop34
loop34:
  %t763 = load i64, ptr %local.skip.758
  %t764 = load i64, ptr %local.lag
  %t765 = icmp slt i64 %t763, %t764
  %t766 = zext i1 %t765 to i64
  %t767 = icmp ne i64 %t766, 0
  br i1 %t767, label %body34, label %endloop34
body34:
  %t768 = load i64, ptr %local.p_lead.755
  %t769 = call i64 @"next_prime"(i64 %t768)
  store i64 %t769, ptr %local.p_lead_nxt.756
  %t770 = load i64, ptr %local.p_lead_nxt.756
  store i64 %t770, ptr %local.p_lead.755
  %t771 = load i64, ptr %local.lead_idx.757
  %t772 = add i64 %t771, 1
  store i64 %t772, ptr %local.lead_idx.757
  %t773 = load i64, ptr %local.skip.758
  %t774 = add i64 %t773, 1
  store i64 %t774, ptr %local.skip.758
  br label %loop34
endloop34:
  br label %loop35
loop35:
  %t775 = load i64, ptr %local.idx.752
  %t776 = load i64, ptr %local.lag
  %t777 = sub i64 200, %t776
  %t778 = icmp slt i64 %t775, %t777
  %t779 = zext i1 %t778 to i64
  %t780 = icmp ne i64 %t779, 0
  br i1 %t780, label %body35, label %endloop35
body35:
  %t781 = load i64, ptr %local.p_cur.750
  %t782 = call i64 @"next_prime"(i64 %t781)
  store i64 %t782, ptr %local.p_nxt.751
  %t783 = load i64, ptr %local.p_lead.755
  %t784 = call i64 @"next_prime"(i64 %t783)
  store i64 %t784, ptr %local.p_lead_nxt.756
  %t785 = load i64, ptr %local.p_nxt.751
  %t786 = load i64, ptr %local.p_cur.750
  %t787 = sub i64 %t785, %t786
  %t788 = call i64 @"sx_int_to_f64"(i64 %t787)
  %t789 = load i64, ptr %local.mean_gap
  %t790 = call i64 @"sx_f64_sub"(i64 %t788, i64 %t789)
  store i64 %t790, ptr %local.g_i.759
  %t791 = load i64, ptr %local.p_lead_nxt.756
  %t792 = load i64, ptr %local.p_lead.755
  %t793 = sub i64 %t791, %t792
  %t794 = call i64 @"sx_int_to_f64"(i64 %t793)
  %t795 = load i64, ptr %local.mean_gap
  %t796 = call i64 @"sx_f64_sub"(i64 %t794, i64 %t795)
  store i64 %t796, ptr %local.g_ik.760
  %t797 = load i64, ptr %local.sum_corr.753
  %t798 = load i64, ptr %local.g_i.759
  %t799 = load i64, ptr %local.g_ik.760
  %t800 = call i64 @"sx_f64_mul"(i64 %t798, i64 %t799)
  %t801 = call i64 @"sx_f64_add"(i64 %t797, i64 %t800)
  store i64 %t801, ptr %local.sum_corr.753
  %t802 = load i64, ptr %local.count.754
  %t803 = add i64 %t802, 1
  store i64 %t803, ptr %local.count.754
  %t804 = load i64, ptr %local.p_nxt.751
  store i64 %t804, ptr %local.p_cur.750
  %t805 = load i64, ptr %local.p_lead_nxt.756
  store i64 %t805, ptr %local.p_lead.755
  %t806 = load i64, ptr %local.idx.752
  %t807 = add i64 %t806, 1
  store i64 %t807, ptr %local.idx.752
  br label %loop35
endloop35:
  %t808 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.91)
  store i64 %t808, ptr %local.r_k.761
  %t809 = load i64, ptr %local.var_gap
  %t810 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.92)
  %t811 = call i64 @"sx_f64_gt"(i64 %t809, i64 %t810)
  %t812 = icmp ne i64 %t811, 0
  br i1 %t812, label %then36, label %else36
then36:
  %t813 = load i64, ptr %local.sum_corr.753
  %t814 = load i64, ptr %local.count.754
  %t815 = call i64 @"sx_int_to_f64"(i64 %t814)
  %t816 = call i64 @"sx_f64_div"(i64 %t813, i64 %t815)
  %t817 = load i64, ptr %local.var_gap
  %t818 = call i64 @"sx_f64_div"(i64 %t816, i64 %t817)
  store i64 %t818, ptr %local.r_k.761
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t819 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t820 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.93)
  %t821 = ptrtoint ptr %t820 to i64
  %t822 = inttoptr i64 %t821 to ptr
  call void @intrinsic_print(ptr %t822)
  %t823 = load i64, ptr %local.lag
  call void @print_i64(i64 %t823)
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.94)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_print(ptr %t826)
  %t827 = load i64, ptr %local.r_k.761
  %t828 = call i64 @"print_f64"(i64 %t827)
  %t829 = load i64, ptr %local.r_k.761
  %t830 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.95)
  %t831 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.96)
  %t832 = call i64 @"sx_f64_sub"(i64 %t830, i64 %t831)
  %t833 = call i64 @"sx_f64_lt"(i64 %t829, i64 %t832)
  %t834 = icmp ne i64 %t833, 0
  br i1 %t834, label %then37, label %else37
then37:
  %t835 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.97)
  %t836 = ptrtoint ptr %t835 to i64
  %t837 = inttoptr i64 %t836 to ptr
  call void @intrinsic_println(ptr %t837)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  %t838 = load i64, ptr %local.r_k.761
  %t839 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.98)
  %t840 = call i64 @"sx_f64_gt"(i64 %t838, i64 %t839)
  %t841 = icmp ne i64 %t840, 0
  br i1 %t841, label %then38, label %else38
then38:
  %t842 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.99)
  %t843 = ptrtoint ptr %t842 to i64
  %t844 = inttoptr i64 %t843 to ptr
  call void @intrinsic_println(ptr %t844)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  %t845 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.100)
  %t846 = ptrtoint ptr %t845 to i64
  %t847 = inttoptr i64 %t846 to ptr
  call void @intrinsic_println(ptr %t847)
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t848 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t849 = phi i64 [ 0, %then37_end ], [ %t848, %else37_end ]
  ret i64 0
}

define i64 @"exp4_twin_prime"() nounwind {
entry:
  %local.p_cur.850 = alloca i64
  %local.p_nxt.851 = alloca i64
  %local.idx.852 = alloca i64
  %local.twin_count.853 = alloca i64
  %local.gap.854 = alloca i64
  %local.window_twins.855 = alloca i64
  %local.window_n.856 = alloca i64
  %local.window_id.857 = alloca i64
  %local.prev_density.858 = alloca i64
  %local.prev_d_density.859 = alloca i64
  %local.density.860 = alloca i64
  %local.d_density.861 = alloca i64
  %local.dd_density.862 = alloca i64
  %local.density_count.863 = alloca i64
  %t864 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.101)
  %t865 = ptrtoint ptr %t864 to i64
  %t866 = inttoptr i64 %t865 to ptr
  call void @intrinsic_println(ptr %t866)
  %t867 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.102)
  %t868 = ptrtoint ptr %t867 to i64
  %t869 = inttoptr i64 %t868 to ptr
  call void @intrinsic_print(ptr %t869)
  store i64 2, ptr %local.p_cur.850
  store i64 0, ptr %local.p_nxt.851
  store i64 1, ptr %local.idx.852
  store i64 0, ptr %local.twin_count.853
  store i64 0, ptr %local.gap.854
  store i64 0, ptr %local.window_twins.855
  store i64 0, ptr %local.window_n.856
  store i64 0, ptr %local.window_id.857
  %t870 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.103)
  store i64 %t870, ptr %local.prev_density.858
  %t871 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.104)
  store i64 %t871, ptr %local.prev_d_density.859
  %t872 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.105)
  store i64 %t872, ptr %local.density.860
  %t873 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.106)
  store i64 %t873, ptr %local.d_density.861
  %t874 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.107)
  store i64 %t874, ptr %local.dd_density.862
  store i64 0, ptr %local.density_count.863
  %t875 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.108)
  %t876 = ptrtoint ptr %t875 to i64
  %t877 = inttoptr i64 %t876 to ptr
  call void @intrinsic_println(ptr %t877)
  %t878 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.109)
  %t879 = ptrtoint ptr %t878 to i64
  %t880 = inttoptr i64 %t879 to ptr
  call void @intrinsic_println(ptr %t880)
  %t881 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.110)
  %t882 = ptrtoint ptr %t881 to i64
  %t883 = inttoptr i64 %t882 to ptr
  call void @intrinsic_print(ptr %t883)
  br label %loop39
loop39:
  %t884 = load i64, ptr %local.idx.852
  %t885 = icmp slt i64 %t884, 200
  %t886 = zext i1 %t885 to i64
  %t887 = icmp ne i64 %t886, 0
  br i1 %t887, label %body39, label %endloop39
body39:
  %t888 = load i64, ptr %local.p_cur.850
  %t889 = call i64 @"next_prime"(i64 %t888)
  store i64 %t889, ptr %local.p_nxt.851
  %t890 = load i64, ptr %local.p_nxt.851
  %t891 = load i64, ptr %local.p_cur.850
  %t892 = sub i64 %t890, %t891
  store i64 %t892, ptr %local.gap.854
  %t893 = load i64, ptr %local.gap.854
  %t894 = icmp eq i64 %t893, 2
  %t895 = zext i1 %t894 to i64
  %t896 = icmp ne i64 %t895, 0
  br i1 %t896, label %then40, label %else40
then40:
  %t897 = load i64, ptr %local.twin_count.853
  %t898 = add i64 %t897, 1
  store i64 %t898, ptr %local.twin_count.853
  %t899 = load i64, ptr %local.window_twins.855
  %t900 = add i64 %t899, 1
  store i64 %t900, ptr %local.window_twins.855
  %t901 = load i64, ptr %local.idx.852
  call void @print_i64(i64 %t901)
  %t902 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.111)
  %t903 = ptrtoint ptr %t902 to i64
  %t904 = inttoptr i64 %t903 to ptr
  call void @intrinsic_print(ptr %t904)
  %t905 = load i64, ptr %local.p_cur.850
  call void @print_i64(i64 %t905)
  %t906 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.112)
  %t907 = ptrtoint ptr %t906 to i64
  %t908 = inttoptr i64 %t907 to ptr
  call void @intrinsic_print(ptr %t908)
  %t909 = load i64, ptr %local.p_nxt.851
  call void @print_i64(i64 %t909)
  %t910 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.113)
  %t911 = ptrtoint ptr %t910 to i64
  %t912 = inttoptr i64 %t911 to ptr
  call void @intrinsic_print(ptr %t912)
  %t913 = load i64, ptr %local.twin_count.853
  %t914 = srem i64 %t913, 5
  %t915 = icmp eq i64 %t914, 0
  %t916 = zext i1 %t915 to i64
  %t917 = icmp ne i64 %t916, 0
  br i1 %t917, label %then41, label %else41
then41:
  %t918 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.114)
  %t919 = ptrtoint ptr %t918 to i64
  %t920 = inttoptr i64 %t919 to ptr
  call void @intrinsic_println(ptr %t920)
  %t921 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.115)
  %t922 = ptrtoint ptr %t921 to i64
  %t923 = inttoptr i64 %t922 to ptr
  call void @intrinsic_print(ptr %t923)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t924 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t925 = phi i64 [ %t924, %then40_end ], [ 0, %else40_end ]
  %t926 = load i64, ptr %local.window_n.856
  %t927 = add i64 %t926, 1
  store i64 %t927, ptr %local.window_n.856
  %t928 = load i64, ptr %local.window_n.856
  %t929 = icmp sge i64 %t928, 50
  %t930 = zext i1 %t929 to i64
  %t931 = icmp ne i64 %t930, 0
  br i1 %t931, label %then42, label %else42
then42:
  %t932 = load i64, ptr %local.window_twins.855
  %t933 = call i64 @"sx_int_to_f64"(i64 %t932)
  %t934 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.116)
  %t935 = call i64 @"sx_f64_div"(i64 %t933, i64 %t934)
  store i64 %t935, ptr %local.density.860
  %t936 = load i64, ptr %local.density_count.863
  %t937 = add i64 %t936, 1
  store i64 %t937, ptr %local.density_count.863
  %t938 = load i64, ptr %local.density_count.863
  %t939 = icmp sge i64 %t938, 2
  %t940 = zext i1 %t939 to i64
  %t941 = icmp ne i64 %t940, 0
  br i1 %t941, label %then43, label %else43
then43:
  %t942 = load i64, ptr %local.density.860
  %t943 = load i64, ptr %local.prev_density.858
  %t944 = call i64 @"sx_f64_sub"(i64 %t942, i64 %t943)
  store i64 %t944, ptr %local.d_density.861
  %t945 = load i64, ptr %local.density_count.863
  %t946 = icmp sge i64 %t945, 3
  %t947 = zext i1 %t946 to i64
  %t948 = icmp ne i64 %t947, 0
  br i1 %t948, label %then44, label %else44
then44:
  %t949 = load i64, ptr %local.d_density.861
  %t950 = load i64, ptr %local.prev_d_density.859
  %t951 = call i64 @"sx_f64_sub"(i64 %t949, i64 %t950)
  store i64 %t951, ptr %local.dd_density.862
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t952 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t953 = load i64, ptr %local.d_density.861
  store i64 %t953, ptr %local.prev_d_density.859
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t954 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t955 = load i64, ptr %local.density.860
  store i64 %t955, ptr %local.prev_density.858
  store i64 0, ptr %local.window_twins.855
  store i64 0, ptr %local.window_n.856
  %t956 = load i64, ptr %local.window_id.857
  %t957 = add i64 %t956, 1
  store i64 %t957, ptr %local.window_id.857
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t958 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t959 = load i64, ptr %local.p_nxt.851
  store i64 %t959, ptr %local.p_cur.850
  %t960 = load i64, ptr %local.idx.852
  %t961 = add i64 %t960, 1
  store i64 %t961, ptr %local.idx.852
  br label %loop39
endloop39:
  %t962 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.117)
  %t963 = ptrtoint ptr %t962 to i64
  %t964 = inttoptr i64 %t963 to ptr
  call void @intrinsic_println(ptr %t964)
  %t965 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.118)
  %t966 = ptrtoint ptr %t965 to i64
  %t967 = inttoptr i64 %t966 to ptr
  call void @intrinsic_println(ptr %t967)
  %t968 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.119)
  %t969 = ptrtoint ptr %t968 to i64
  %t970 = inttoptr i64 %t969 to ptr
  call void @intrinsic_print(ptr %t970)
  %t971 = load i64, ptr %local.twin_count.853
  call void @print_i64(i64 %t971)
  %t972 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.120)
  %t973 = ptrtoint ptr %t972 to i64
  %t974 = inttoptr i64 %t973 to ptr
  call void @intrinsic_println(ptr %t974)
  %t975 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.121)
  %t976 = ptrtoint ptr %t975 to i64
  %t977 = inttoptr i64 %t976 to ptr
  call void @intrinsic_print(ptr %t977)
  %t978 = load i64, ptr %local.twin_count.853
  %t979 = call i64 @"sx_int_to_f64"(i64 %t978)
  %t980 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.122)
  %t981 = call i64 @"sx_f64_div"(i64 %t979, i64 %t980)
  %t982 = call i64 @"print_f64"(i64 %t981)
  %t983 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.123)
  %t984 = ptrtoint ptr %t983 to i64
  %t985 = inttoptr i64 %t984 to ptr
  call void @intrinsic_println(ptr %t985)
  %t986 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.124)
  %t987 = ptrtoint ptr %t986 to i64
  %t988 = inttoptr i64 %t987 to ptr
  call void @intrinsic_println(ptr %t988)
  %t989 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.125)
  %t990 = ptrtoint ptr %t989 to i64
  %t991 = inttoptr i64 %t990 to ptr
  call void @intrinsic_println(ptr %t991)
  %t992 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.126)
  %t993 = ptrtoint ptr %t992 to i64
  %t994 = inttoptr i64 %t993 to ptr
  call void @intrinsic_println(ptr %t994)
  %t995 = call i64 @"exp4_density_detail"()
  ret i64 0
}

define i64 @"exp4_density_detail"() nounwind {
entry:
  %local.p_cur.996 = alloca i64
  %local.p_nxt.997 = alloca i64
  %local.idx.998 = alloca i64
  %local.gap.999 = alloca i64
  %local.twin_buf_sum.1000 = alloca i64
  %local.buf_count.1001 = alloca i64
  %local.density.1002 = alloca i64
  %local.prev_density.1003 = alloca i64
  %local.prev_d.1004 = alloca i64
  %local.d_val.1005 = alloca i64
  %local.dd_val.1006 = alloca i64
  %local.checkpoint.1007 = alloca i64
  %local.block_twins.1008 = alloca i64
  %local.block_n.1009 = alloca i64
  %local.block_id.1010 = alloca i64
  %local.reported.1011 = alloca i64
  store i64 2, ptr %local.p_cur.996
  store i64 0, ptr %local.p_nxt.997
  store i64 1, ptr %local.idx.998
  store i64 0, ptr %local.gap.999
  store i64 0, ptr %local.twin_buf_sum.1000
  store i64 0, ptr %local.buf_count.1001
  %t1012 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.127)
  store i64 %t1012, ptr %local.density.1002
  %t1013 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.128)
  store i64 %t1013, ptr %local.prev_density.1003
  %t1014 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.129)
  store i64 %t1014, ptr %local.prev_d.1004
  %t1015 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.130)
  store i64 %t1015, ptr %local.d_val.1005
  %t1016 = call i64 @f64_parse(ptr @.str.exp_prime_gaps.131)
  store i64 %t1016, ptr %local.dd_val.1006
  store i64 0, ptr %local.checkpoint.1007
  store i64 0, ptr %local.block_twins.1008
  store i64 0, ptr %local.block_n.1009
  store i64 0, ptr %local.block_id.1010
  store i64 0, ptr %local.reported.1011
  br label %loop45
loop45:
  %t1017 = load i64, ptr %local.idx.998
  %t1018 = icmp slt i64 %t1017, 200
  %t1019 = zext i1 %t1018 to i64
  %t1020 = icmp ne i64 %t1019, 0
  br i1 %t1020, label %body45, label %endloop45
body45:
  %t1021 = load i64, ptr %local.p_cur.996
  %t1022 = call i64 @"next_prime"(i64 %t1021)
  store i64 %t1022, ptr %local.p_nxt.997
  %t1023 = load i64, ptr %local.p_nxt.997
  %t1024 = load i64, ptr %local.p_cur.996
  %t1025 = sub i64 %t1023, %t1024
  store i64 %t1025, ptr %local.gap.999
  %t1026 = load i64, ptr %local.gap.999
  %t1027 = icmp eq i64 %t1026, 2
  %t1028 = zext i1 %t1027 to i64
  %t1029 = icmp ne i64 %t1028, 0
  br i1 %t1029, label %then46, label %else46
then46:
  %t1030 = load i64, ptr %local.block_twins.1008
  %t1031 = add i64 %t1030, 1
  store i64 %t1031, ptr %local.block_twins.1008
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1032 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t1033 = load i64, ptr %local.block_n.1009
  %t1034 = add i64 %t1033, 1
  store i64 %t1034, ptr %local.block_n.1009
  %t1035 = load i64, ptr %local.idx.998
  %t1036 = srem i64 %t1035, 10
  %t1037 = icmp eq i64 %t1036, 0
  %t1038 = zext i1 %t1037 to i64
  %t1039 = icmp ne i64 %t1038, 0
  br i1 %t1039, label %then47, label %else47
then47:
  %t1040 = load i64, ptr %local.block_n.1009
  %t1041 = icmp sgt i64 %t1040, 0
  %t1042 = zext i1 %t1041 to i64
  %t1043 = icmp ne i64 %t1042, 0
  br i1 %t1043, label %then48, label %else48
then48:
  %t1044 = load i64, ptr %local.block_twins.1008
  %t1045 = call i64 @"sx_int_to_f64"(i64 %t1044)
  %t1046 = load i64, ptr %local.block_n.1009
  %t1047 = call i64 @"sx_int_to_f64"(i64 %t1046)
  %t1048 = call i64 @"sx_f64_div"(i64 %t1045, i64 %t1047)
  store i64 %t1048, ptr %local.density.1002
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1049 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1050 = load i64, ptr %local.density.1002
  %t1051 = load i64, ptr %local.prev_density.1003
  %t1052 = call i64 @"sx_f64_sub"(i64 %t1050, i64 %t1051)
  store i64 %t1052, ptr %local.d_val.1005
  %t1053 = load i64, ptr %local.d_val.1005
  %t1054 = load i64, ptr %local.prev_d.1004
  %t1055 = call i64 @"sx_f64_sub"(i64 %t1053, i64 %t1054)
  store i64 %t1055, ptr %local.dd_val.1006
  %t1056 = load i64, ptr %local.idx.998
  %t1057 = icmp sge i64 %t1056, 20
  %t1058 = zext i1 %t1057 to i64
  %t1059 = icmp ne i64 %t1058, 0
  br i1 %t1059, label %then49, label %else49
then49:
  %t1060 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.132)
  %t1061 = ptrtoint ptr %t1060 to i64
  %t1062 = inttoptr i64 %t1061 to ptr
  call void @intrinsic_print(ptr %t1062)
  %t1063 = load i64, ptr %local.idx.998
  call void @print_i64(i64 %t1063)
  %t1064 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.133)
  %t1065 = ptrtoint ptr %t1064 to i64
  %t1066 = inttoptr i64 %t1065 to ptr
  call void @intrinsic_print(ptr %t1066)
  %t1067 = load i64, ptr %local.density.1002
  %t1068 = call i64 @"print_f64"(i64 %t1067)
  %t1069 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.134)
  %t1070 = ptrtoint ptr %t1069 to i64
  %t1071 = inttoptr i64 %t1070 to ptr
  call void @intrinsic_print(ptr %t1071)
  %t1072 = load i64, ptr %local.d_val.1005
  %t1073 = call i64 @"print_f64"(i64 %t1072)
  %t1074 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.135)
  %t1075 = ptrtoint ptr %t1074 to i64
  %t1076 = inttoptr i64 %t1075 to ptr
  call void @intrinsic_print(ptr %t1076)
  %t1077 = load i64, ptr %local.dd_val.1006
  %t1078 = call i64 @"print_f64"(i64 %t1077)
  %t1079 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.136)
  %t1080 = ptrtoint ptr %t1079 to i64
  %t1081 = inttoptr i64 %t1080 to ptr
  call void @intrinsic_println(ptr %t1081)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1082 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t1083 = load i64, ptr %local.d_val.1005
  store i64 %t1083, ptr %local.prev_d.1004
  %t1084 = load i64, ptr %local.density.1002
  store i64 %t1084, ptr %local.prev_density.1003
  %t1085 = load i64, ptr %local.reported.1011
  %t1086 = add i64 %t1085, 1
  store i64 %t1086, ptr %local.reported.1011
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1087 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t1088 = load i64, ptr %local.block_n.1009
  %t1089 = icmp sge i64 %t1088, 50
  %t1090 = zext i1 %t1089 to i64
  %t1091 = icmp ne i64 %t1090, 0
  br i1 %t1091, label %then50, label %else50
then50:
  store i64 0, ptr %local.block_twins.1008
  store i64 0, ptr %local.block_n.1009
  %t1092 = load i64, ptr %local.block_id.1010
  %t1093 = add i64 %t1092, 1
  store i64 %t1093, ptr %local.block_id.1010
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1094 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1095 = load i64, ptr %local.p_nxt.997
  store i64 %t1095, ptr %local.p_cur.996
  %t1096 = load i64, ptr %local.idx.998
  %t1097 = add i64 %t1096, 1
  store i64 %t1097, ptr %local.idx.998
  br label %loop45
endloop45:
  %t1098 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.137)
  %t1099 = ptrtoint ptr %t1098 to i64
  %t1100 = inttoptr i64 %t1099 to ptr
  call void @intrinsic_println(ptr %t1100)
  %t1101 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.138)
  %t1102 = ptrtoint ptr %t1101 to i64
  %t1103 = inttoptr i64 %t1102 to ptr
  call void @intrinsic_println(ptr %t1103)
  %t1104 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.139)
  %t1105 = ptrtoint ptr %t1104 to i64
  %t1106 = inttoptr i64 %t1105 to ptr
  call void @intrinsic_println(ptr %t1106)
  %t1107 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.140)
  %t1108 = ptrtoint ptr %t1107 to i64
  %t1109 = inttoptr i64 %t1108 to ptr
  call void @intrinsic_println(ptr %t1109)
  %t1110 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.141)
  %t1111 = ptrtoint ptr %t1110 to i64
  %t1112 = inttoptr i64 %t1111 to ptr
  call void @intrinsic_println(ptr %t1112)
  %t1113 = call ptr @intrinsic_string_new(ptr @.str.exp_prime_gaps.142)
  %t1114 = ptrtoint ptr %t1113 to i64
  %t1115 = inttoptr i64 %t1114 to ptr
  call void @intrinsic_println(ptr %t1115)
  ret i64 0
}


; String constants
@.str.exp_prime_gaps.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.2 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_prime_gaps.3 = private unnamed_addr constant [54 x i8] c"  PRIME NUMBER GAPS: HIGHER-ORDER DERIVATIVE ANALYSIS\00"
@.str.exp_prime_gaps.4 = private unnamed_addr constant [59 x i8] c"  Exploring structure in prime distribution via D, D', D''\00"
@.str.exp_prime_gaps.5 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_prime_gaps.6 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.7 = private unnamed_addr constant [43 x i8] c"=== Exp 1: Prime Gap Derivative Series ===\00"
@.str.exp_prime_gaps.8 = private unnamed_addr constant [45 x i8] c"  Computing first 200 primes and their gaps.\00"
@.str.exp_prime_gaps.9 = private unnamed_addr constant [50 x i8] c"  Then computing G, G', G'', G''' and statistics.\00"
@.str.exp_prime_gaps.10 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.11 = private unnamed_addr constant [44 x i8] c"  First 30 values of each derivative order:\00"
@.str.exp_prime_gaps.12 = private unnamed_addr constant [37 x i8] c"  i     G(i)   G'(i)  G''(i) G'''(i)\00"
@.str.exp_prime_gaps.13 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_prime_gaps.14 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_prime_gaps.15 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_prime_gaps.16 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_prime_gaps.17 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_prime_gaps.18 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.19 = private unnamed_addr constant [6 x i8] c"  ...\00"
@.str.exp_prime_gaps.20 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.21 = private unnamed_addr constant [43 x i8] c"  --- Derivative Statistics (199 gaps) ---\00"
@.str.exp_prime_gaps.22 = private unnamed_addr constant [19 x i8] c"  Mean gap G:     \00"
@.str.exp_prime_gaps.23 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.24 = private unnamed_addr constant [19 x i8] c"  Mean G':        \00"
@.str.exp_prime_gaps.25 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.26 = private unnamed_addr constant [19 x i8] c"  Mean |G'|:      \00"
@.str.exp_prime_gaps.27 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.28 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.29 = private unnamed_addr constant [23 x i8] c"  Sign changes G':    \00"
@.str.exp_prime_gaps.30 = private unnamed_addr constant [4 x i8] c" / \00"
@.str.exp_prime_gaps.31 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.32 = private unnamed_addr constant [23 x i8] c"  Sign changes G'':   \00"
@.str.exp_prime_gaps.33 = private unnamed_addr constant [4 x i8] c" / \00"
@.str.exp_prime_gaps.34 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.35 = private unnamed_addr constant [23 x i8] c"  Sign changes G''':  \00"
@.str.exp_prime_gaps.36 = private unnamed_addr constant [4 x i8] c" / \00"
@.str.exp_prime_gaps.37 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.38 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.39 = private unnamed_addr constant [26 x i8] c"  Sign change rate G':   \00"
@.str.exp_prime_gaps.40 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.41 = private unnamed_addr constant [26 x i8] c"  Sign change rate G'':  \00"
@.str.exp_prime_gaps.42 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.43 = private unnamed_addr constant [26 x i8] c"  Sign change rate G''': \00"
@.str.exp_prime_gaps.44 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.45 = private unnamed_addr constant [64 x i8] c"  (Higher rate = more oscillatory. Expect increase with order.)\00"
@.str.exp_prime_gaps.46 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.47 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.48 = private unnamed_addr constant [39 x i8] c"=== Exp 2: Running Average of Gaps ===\00"
@.str.exp_prime_gaps.49 = private unnamed_addr constant [42 x i8] c"  Does running average converge to ln(p)?\00"
@.str.exp_prime_gaps.50 = private unnamed_addr constant [32 x i8] c"  Windows of 10, 20, 50 primes.\00"
@.str.exp_prime_gaps.51 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.52 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.54 = private unnamed_addr constant [35 x i8] c"=== Exp 3: Gap Autocorrelation ===\00"
@.str.exp_prime_gaps.55 = private unnamed_addr constant [53 x i8] c"  R(k) = mean((g(i)-mean_g)*(g(i+k)-mean_g)) / var_g\00"
@.str.exp_prime_gaps.56 = private unnamed_addr constant [47 x i8] c"  Known: slight negative correlation at lag 1.\00"
@.str.exp_prime_gaps.57 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.59 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.60 = private unnamed_addr constant [33 x i8] c"=== Exp 4: Twin Prime Signal ===\00"
@.str.exp_prime_gaps.61 = private unnamed_addr constant [44 x i8] c"  T(i)=1 if g(i)=2 (twin prime gap), else 0\00"
@.str.exp_prime_gaps.62 = private unnamed_addr constant [52 x i8] c"  Running density in windows of 50, then D, D', D''\00"
@.str.exp_prime_gaps.63 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.64 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.65 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_prime_gaps.66 = private unnamed_addr constant [20 x i8] c"  ANALYSIS COMPLETE\00"
@.str.exp_prime_gaps.67 = private unnamed_addr constant [58 x i8] c"  No conjectures claimed -- only structure characterised.\00"
@.str.exp_prime_gaps.68 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_prime_gaps.69 = private unnamed_addr constant [56 x i8] c"  Checkpoint  AvgGap(10)  AvgGap(20)  AvgGap(50)  ln(p)\00"
@.str.exp_prime_gaps.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.73 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.74 = private unnamed_addr constant [51 x i8] c"  By prime number theorem, avg gap near p ~ ln(p).\00"
@.str.exp_prime_gaps.75 = private unnamed_addr constant [58 x i8] c"  Convergence should be visible as window size increases.\00"
@.str.exp_prime_gaps.76 = private unnamed_addr constant [5 x i8] c"  p(\00"
@.str.exp_prime_gaps.77 = private unnamed_addr constant [3 x i8] c")=\00"
@.str.exp_prime_gaps.78 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_prime_gaps.79 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_prime_gaps.80 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_prime_gaps.81 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_prime_gaps.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.83 = private unnamed_addr constant [13 x i8] c"  Mean gap: \00"
@.str.exp_prime_gaps.84 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.86 = private unnamed_addr constant [13 x i8] c"  Variance: \00"
@.str.exp_prime_gaps.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.88 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.89 = private unnamed_addr constant [35 x i8] c"  Lag    R(k)       Interpretation\00"
@.str.exp_prime_gaps.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.92 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.93 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_prime_gaps.94 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_prime_gaps.95 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.96 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_prime_gaps.97 = private unnamed_addr constant [30 x i8] c"   negative (anti-correlated)\00"
@.str.exp_prime_gaps.98 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_prime_gaps.99 = private unnamed_addr constant [25 x i8] c"   positive (correlated)\00"
@.str.exp_prime_gaps.100 = private unnamed_addr constant [28 x i8] c"   near zero (uncorrelated)\00"
@.str.exp_prime_gaps.101 = private unnamed_addr constant [55 x i8] c"  Twin prime locations (gap=2) among first 200 primes:\00"
@.str.exp_prime_gaps.102 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_prime_gaps.103 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.104 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.105 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.106 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.107 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.108 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.109 = private unnamed_addr constant [32 x i8] c"  Twin primes found at indices:\00"
@.str.exp_prime_gaps.110 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_prime_gaps.111 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.exp_prime_gaps.112 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_prime_gaps.113 = private unnamed_addr constant [3 x i8] c") \00"
@.str.exp_prime_gaps.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.115 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_prime_gaps.116 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_prime_gaps.117 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.118 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.119 = private unnamed_addr constant [44 x i8] c"  Total twin prime gaps in first 199 gaps: \00"
@.str.exp_prime_gaps.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.121 = private unnamed_addr constant [24 x i8] c"  Twin prime fraction: \00"
@.str.exp_prime_gaps.122 = private unnamed_addr constant [6 x i8] c"199.0\00"
@.str.exp_prime_gaps.123 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.124 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.125 = private unnamed_addr constant [64 x i8] c"  --- Twin Prime Density (trailing 50-gap window, every 10) ---\00"
@.str.exp_prime_gaps.126 = private unnamed_addr constant [44 x i8] c"  Index   Density   D(density)  D'(density)\00"
@.str.exp_prime_gaps.127 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.129 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.131 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_prime_gaps.132 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_prime_gaps.133 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_prime_gaps.134 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_prime_gaps.135 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_prime_gaps.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.137 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_prime_gaps.138 = private unnamed_addr constant [16 x i8] c"  Observations:\00"
@.str.exp_prime_gaps.139 = private unnamed_addr constant [46 x i8] c"  - Twin prime density should decrease slowly\00"
@.str.exp_prime_gaps.140 = private unnamed_addr constant [37 x i8] c"  - D(density) shows rate of decline\00"
@.str.exp_prime_gaps.141 = private unnamed_addr constant [54 x i8] c"  - D'(density) shows whether decline is accelerating\00"
@.str.exp_prime_gaps.142 = private unnamed_addr constant [62 x i8] c"  - Sign changes in D' indicate oscillation in twin frequency\00"
